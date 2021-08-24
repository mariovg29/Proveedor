import 'package:flutter/material.dart';
import 'package:proveedor/src/screens/home/widgets_home/background_home.dart';
import 'package:proveedor/src/screens/home/widgets_home/bienvenida_home.dart';



class HomeScreen extends StatelessWidget {
  // final Function logoutSuccess;

  // const HomeScreen({Key? key, required this.logoutSuccess}) : super(key: key);

  

 

  @override
  Widget build(BuildContext context) {

           
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff6161),
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          BackgroundHome(),
          BienvenidaHome(),
          

        ],
        
      )
     
     
            
    );
  }
}