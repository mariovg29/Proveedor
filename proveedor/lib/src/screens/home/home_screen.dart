
import 'package:flutter/material.dart';
import 'package:proveedor/src/screens/home/widgets_home/background_home.dart';
import 'package:proveedor/src/screens/home/widgets_home/bienvenida_home.dart';
import 'package:proveedor/src/screens/home/widgets_home/botones_home.dart';
import 'package:proveedor/src/screens/login/Widgets/servicio_card_home.dart';
import 'package:proveedor/src/screens/login/services/auth_service.dart';
import 'package:proveedor/src/screens/login/services/servicios_service.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatelessWidget {

  
  // final Function logoutSuccess;

  // const HomeScreen({Key? key, required this.logoutSuccess}) : super(key: key);

  

 

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    

           
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff6161),
        actions: [
          IconButton(
            onPressed: (){
              authService.logout();
              Navigator.pushReplacementNamed(context, '/');
            },
             icon: Icon(Icons.login_outlined)),
        ],
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
              
              TextHoyWidget(),

              Servicios()
            ],
          ),
          

        ],
        
      )
     
     
            
    );
  }
}

class TextHoyWidget extends StatelessWidget {
  const TextHoyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 70,
      padding: EdgeInsets.only(top: 5),
      child: Text('Hoy', 
      style: TextStyle(
        fontSize: 30,
        color: Color(0xffff6161),
        fontWeight: FontWeight.bold),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class Servicios extends StatelessWidget {
  const Servicios({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<Services>(context);
    return Expanded(                
      child:  Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10,right: 5,left:5),
          decoration: BoxDecoration(
             //color: Color(0xffff6161).withOpacity(0.8),
             borderRadius: BorderRadius.circular(10)
          ),
         
          
          child: ListView.builder(
          itemCount: productsService.servicios.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  productsService.selectedServiced =
                      productsService.servicios[index].copy();
                  Navigator.pushNamed(context, 'product');
                },
                child: ServicioCardHome(
                  servicio: productsService.servicios[index],
                ),
              )),
          ),
      )
      );
  }
}