import 'package:flutter/material.dart';

class InputDecoracion {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? icono,
  }) {
    return InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.pink, width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: icono != null ? Icon(icono, color: Colors.pink) : null);
  }
}
