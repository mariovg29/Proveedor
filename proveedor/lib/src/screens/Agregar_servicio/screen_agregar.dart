import 'package:flutter/material.dart';

class AgregarScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear Servicio'),
       centerTitle: true,
       actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Hero(
            tag: 'Agregar Servicio',
            child: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.add, size: 30),
                  radius: 23,
            ),
          ),
        )
        ],
       ),
      
    );
  }
}