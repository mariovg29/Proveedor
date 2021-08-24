import 'package:flutter/material.dart';

class DescuentosScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear Descuento'),
       centerTitle: true,
       actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Hero(
            tag: 'Descuentos',
            child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.money_off,size: 30),
                  radius: 23,
            ),
          ),
        )
      ],
       
       ),
      
    );
  }
}