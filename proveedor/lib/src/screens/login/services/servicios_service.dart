import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proveedor/src/screens/login/models/models.dart';
import 'package:http/http.dart' as http;

class Services extends ChangeNotifier {
  final String _baseUrl = 'okparty0-d71bc-default-rtdb.firebaseio.com';
  final List<Servicios> servicios = [];
  late Servicios selectedServiced;

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  Services() {
    this.loadServicio();
  }

  Future<List<Servicios>> loadServicio() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'servicios.json');
    final resp = await http.get(url);
    print(resp.body);

    final Map<String, dynamic> serviciosMap = json.decode(resp.body);

    serviciosMap.forEach((key, value) {
      final tempServicio = Servicios.fromMap(value);
      tempServicio.id = key;
      this.servicios.add(tempServicio);
    });

    this.isLoading = false;
    notifyListeners();

    return this.servicios;
  }

  Future saveOrCreateServicio(Servicios servicio) async {
    isSaving = true;
    notifyListeners();

    if (servicio.id == null) {
      // Es necesario crear
      await this.createServicio(servicio);
    } else {
      // Actualizar
      await this.updateServicio(servicio);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateServicio(Servicios servicio) async {
    final url = Uri.https(_baseUrl, 'servicios/${servicio.id}.json');
    final resp = await http.put(url, body: servicio.toJson());
    final decodedData = resp.body;

    //TODO: Actualizar el listado de Servicioos
    final index =
        this.servicios.indexWhere((element) => element.id == servicio.id);
    this.servicios[index] = servicio;

    return servicio.id!;
  }

  Future<String> createServicio(Servicios servicio) async {
    final url = Uri.https(_baseUrl, 'servicios.json');
    final resp = await http.post(url, body: servicio.toJson());
    final decodedData = json.decode(resp.body);

    servicio.id = decodedData['name'];

    this.servicios.add(servicio);

    return servicio.id!;
  }

  void updateSelectedServicioImage(String path) {
    this.selectedServiced.imagen = path;
    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/danx00/image/upload?upload_preset=niyn10yo');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salio mal');
      print(resp.body);
      return null;
    }

    this.newPictureFile = null;

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }

  Future<String> borrarServicio(Servicios servicio) async {
    isSaving = true;
    notifyListeners();

    final url = '$_baseUrl/servicios/$servicio.id.json?';
    final resp = await http.delete(Uri.parse(url));
    print(json.decode(resp.body));

    final index =
        this.servicios.indexWhere((element) => element.id == servicio.id);
    this.servicios[index] = servicio;

    isSaving = false;
    notifyListeners();

    return servicio.id!;
  }
}
