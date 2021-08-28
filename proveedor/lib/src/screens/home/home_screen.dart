import 'package:flutter/material.dart';
import 'package:proveedor/src/screens/home/widgets_home/background_home.dart';
import 'package:proveedor/src/screens/home/widgets_home/bienvenida_home.dart';
import 'package:proveedor/src/screens/home/widgets_home/botones_home.dart';



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
          Column(
            children: [
              BienvenidaHome(),

              BotonesHome(),

              Servicios()
            ],
          ),
          

        ],
        
      )
     
     
            
    );
  }
}

class Servicios extends StatelessWidget {
  const Servicios({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(                
      child:  Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10,right: 5,left:5),
          decoration: BoxDecoration(
             color: Color(0xffff6161).withOpacity(0.8),
             borderRadius: BorderRadius.circular(10)
          ),
         
          
          child: Column(
            children: [                       
              SizedBox(height: 10,),
              Text('Espacio para lista de servicios',style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text('Espacio para lista de servicios',style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text('Espacio para lista de servicios',style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text('Espacio para lista de servicios',style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text('Espacio para lista de servicios',style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text('Espacio para lista de servicios',style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text('Espacio para lista de servicios',style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text('Espacio para lista de servicios',style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text('Espacio para lista de servicios',style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text('Espacio para lista de servicios',style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text('Espacio para lista de servicios',style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text('Espacio para lista de servicios',style: TextStyle(color: Colors.white),),
              
              
             

            ],
          )
          ),
      )
      );
  }
}