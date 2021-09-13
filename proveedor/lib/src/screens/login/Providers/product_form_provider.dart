import 'package:flutter/material.dart';
import 'package:proveedor/src/screens/login/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Servicios servicios;

  ProductFormProvider(this.servicios);

  updateAvailability(bool value) {
    print(value);
    this.servicios.disponibilidad = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(servicios.nombre);
    print(servicios.precio);
    print(servicios.disponibilidad);

    return formKey.currentState?.validate() ?? false;
  }
}
