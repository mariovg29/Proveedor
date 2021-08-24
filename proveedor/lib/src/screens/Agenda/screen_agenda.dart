import 'package:flutter/material.dart';

class AgendaScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agenda'),
      centerTitle: true,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Hero(
            tag: 'Agenda',
            child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.view_agenda, size: 30),
                  radius: 23,
            ),
          ),
        )
      ],
      ),
      
    );
  }
}