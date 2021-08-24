import 'package:flutter/material.dart';

class HistorialScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Historial'),
      centerTitle: true,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Hero(
            tag: 'Historial',
            child: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.history, size: 30),
                  radius: 23,
            ),
          ),
        )
      ],
       ),
      
    );
  }
}