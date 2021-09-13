// To parse this JSON data, do
//
//     final servicios = serviciosFromMap(jsonString);

import 'dart:convert';

class Servicios {
  Servicios(
      {this.descripcion,
      required this.disponibilidad,
      this.imagen,
      required this.nombre,
      required this.precio,
      this.id});

  String? descripcion;
  bool disponibilidad;
  String? imagen;
  String nombre;
  double precio;
  String? id;

  factory Servicios.fromJson(String str) => Servicios.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Servicios.fromMap(Map<String, dynamic> json) => Servicios(
        descripcion: json["descripcion"],
        disponibilidad: json["disponibilidad"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        precio: json["precio"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "disponibilidad": disponibilidad,
        "imagen": imagen,
        "nombre": nombre,
        "precio": precio,
      };

  Servicios copy() => Servicios(
        descripcion: this.descripcion,
        disponibilidad: this.disponibilidad,
        nombre: this.nombre,
        imagen: this.imagen,
        precio: this.precio,
        id: this.id,
      );
}
