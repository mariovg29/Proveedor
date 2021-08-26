import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proveedor/src/screens/historial/widgets_historial/graph_historial.dart';

class HistorialScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Historial'),
      backgroundColor: Color(0xffff6161),
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
       body: _body(),
      
    );
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        children: [
          _selector(),
          _ventas(),
          _graph(),
          Container(
            color: Color(0xffff6161).withOpacity(0.15),
            height: 20 ,
          ),
          _list(),
        ],
      ),

    );
  }
}

Widget _selector()=>Container();

Widget _ventas(){
  return Column(
    children: [
      Text('\$2345.41', 
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
        color: Color(0xffff6161),)

      ),
      Text('Total de Ventas en el mes',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        color: Colors.blueGrey,)
      )
    ],

  );
  }

Widget _graph(){
  return Container(
    height: 150,

    child: GraphWidget(),

);
}
Widget _item(IconData icon, String nombre, int percent, double value){
  return ListTile(
    leading: Icon(icon, size: 32.0),
    title: Text(nombre, 
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold)
      ),
    subtitle: Text("$percent% de las ventas"),
    trailing: Container(
      decoration: BoxDecoration(
        color:  Color(0xffff6161),
        borderRadius: BorderRadius.circular(5)

      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('\$$value', 
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16) ,),
      )),
  );
}
Widget _list(){
  return Expanded(
    child: ListView(
      children: [
        _item(FontAwesomeIcons.shoppingCart, "Mariachi que sabe todas", 14, 145.12),
        _item(FontAwesomeIcons.shoppingCart, "Unas bien frias", 10, 100.00),
        _item(FontAwesomeIcons.shoppingCart, "Chelas pa la banda", 10, 99.12),
        _item(FontAwesomeIcons.shoppingCart, "Paquete diviertas", 20, 200.12),
        _item(FontAwesomeIcons.shoppingCart, "Mariachi que sabe todas", 14, 145.12),
        _item(FontAwesomeIcons.shoppingCart, "Unas bien frias", 10, 100.00),
        _item(FontAwesomeIcons.shoppingCart, "Mariachi que sabe todas", 14, 145.12),
        _item(FontAwesomeIcons.shoppingCart, "Mariachi que sabe todas", 14, 145.12),         
        _item(FontAwesomeIcons.shoppingCart, "Unas bien frias", 10, 100.00),
        _item(FontAwesomeIcons.shoppingCart, "Chelas pa la banda", 10, 99.12),
         

      ],
    ),
  );
}