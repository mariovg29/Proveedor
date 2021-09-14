import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String email = "";
  String password = "";

  bool _cargando = false;

  bool get cargando => _cargando;

  set cargando(bool value) {
    _cargando = value;
    notifyListeners();
  }

  bool validacion() {
    return formKey.currentState?.validate() ?? false;
  }
}
