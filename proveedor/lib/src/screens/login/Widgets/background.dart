import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _CajaSuperior(),
          Icono(),
          this.child,
        ],
      ),
    );
  }
}

class Icono extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}

class _CajaSuperior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: <Color>[
                Color.fromRGBO(255, 101, 91, 1),
                Color.fromRGBO(255, 58, 88, 1),
              ],
            ),
          ),
        ),
        Positioned(child: _Burbuja(), top: 150, left: 30),
        Positioned(child: _Burbuja(), top: 00, left: 00),
        Positioned(child: _Burbuja(), top: 50, right: 90),
        Positioned(child: _Burbuja(), top: 200, left: 200),
        Positioned(child: _Burbuja(), bottom: 120, right: 20),
      ],
    );
  }
}

class _Burbuja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
