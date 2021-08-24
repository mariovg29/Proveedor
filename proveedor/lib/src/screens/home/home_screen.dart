import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  final Function logoutSuccess;

  const HomeScreen({Key? key, required this.logoutSuccess}) : super(key: key);

  

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[Center(
            child: Text('Pagina principal de proveedor',
             style: TextStyle(fontSize: 30, color: Colors.blueAccent)
            ),
            
          ),
             ElevatedButton(
              child: Text('Cerrar sesion'),
              onPressed: (){
                logoutSuccess();
                

              },
            ),
          ]
        ),
      ),
      
      
    );
  }
}