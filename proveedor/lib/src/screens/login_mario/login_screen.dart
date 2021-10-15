import 'package:flutter/material.dart';
import 'package:proveedor/src/screens/login_mario/login_state.dart';
import 'package:provider/provider.dart';
class LoginScreen2 extends StatelessWidget {
  const LoginScreen2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                child:Text('Inicio'),
                onPressed: (){Provider.of<LoginState>(context, listen:false).login();}
              ),
             
            ],
          ),
        ),
      ),
      
      
    );
  }
}