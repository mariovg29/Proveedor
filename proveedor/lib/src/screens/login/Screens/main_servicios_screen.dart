import 'package:flutter/material.dart';
import 'package:proveedor/src/screens/login/Widgets/widgets.dart';
import 'package:proveedor/src/screens/login/models/servicio.dart';
import 'package:proveedor/src/screens/login/services/services.dart';
import 'package:provider/provider.dart';

import 'loading_screen.dart';

class ServiciosEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<Services>(context);

    if (productsService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(title: Text(' Mis Servicios'),
       backgroundColor: Color(0xffff6161),
      centerTitle: true,
       actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Hero(
            tag: 'Mis Servicios',
            child: CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: Icon(Icons.design_services, size: 30),
                  radius: 23,
            ),
          ),
        )
      ],
      ),
      body: ListView.builder(
          itemCount: productsService.servicios.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  productsService.selectedServiced =
                      productsService.servicios[index].copy();
                  Navigator.pushNamed(context, 'product');
                },
                child: ServicioCard(
                  servicio: productsService.servicios[index],
                ),
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productsService.selectedServiced =
              new Servicios(disponibilidad: false, nombre: '', precio: 0);
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}
