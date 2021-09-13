import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mi Perfil'),
       centerTitle: true,
       actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Hero(
            tag: 'Mi Perfil',
            child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.verified_user, size: 30),
                  radius: 23,
            ),
          ),
        )
      ],
       ),
      
    );
  }
}