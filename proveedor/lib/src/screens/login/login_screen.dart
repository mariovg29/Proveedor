import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  final Function loginSuccess;

  const LoginScreen({Key? key, required this.loginSuccess}) : super(key: key);

  
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff6161),
        title: Text('Iniciar sesión'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[Center(
            child: Text('Inicia sesión y genera ganancias',
            style: TextStyle(fontSize: 30, color: Colors.green)
            ),            
          ), ElevatedButton(
              child: Text('Login'),
              onPressed: (){
                loginSuccess();
              },
            ),
          ]


          
        ),
      ),      
    );
  }
}