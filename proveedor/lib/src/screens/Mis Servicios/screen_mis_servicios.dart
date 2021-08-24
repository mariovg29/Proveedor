import 'package:flutter/material.dart';

class ServiciosScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mis Servicios'),
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
      ],),
      
    );
  }
}