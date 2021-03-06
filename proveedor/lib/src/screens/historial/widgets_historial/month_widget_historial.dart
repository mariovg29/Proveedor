
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proveedor/src/screens/historial/widgets_historial/graph_historial.dart';
class MonthWidgetHistorial extends StatefulWidget {
  //const MonthWidgetHistorial({ Key? key }) : super(key: key);

  final List<DocumentSnapshot> ventas;
  final List<double> daily;
  
  final double total;
//Inicializa el valor de las ventas en 0 y hace la suma de la lista
  MonthWidgetHistorial({Key? key, required this.ventas}) :
        total= ventas.map((docs) => docs['Precio'])
        .fold(0.0, (a,b) => a+b),
        daily = List.generate(30, (index) {
          return ventas.where((docs) => docs['Dia']== (index+1)).map
          ((docs) => docs['Precio']).fold(0.0, (a, b) => a+b);
        }),
        
       
        
        super(key: key);


  @override
  _MonthWidgetHistorialState createState() => _MonthWidgetHistorialState();
}

class _MonthWidgetHistorialState extends State<MonthWidgetHistorial> {
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
            _ventas(),
            _graph(),
            Container(
              color: Color(0xffff6161).withOpacity(0.15),
              height: 20 ,
            ),
            _list(),  
        ]    
      ),
    );
    
  }

  

Widget _ventas(){
  return Column(
    children: <Widget>[
      Text('\$${widget.total.toStringAsFixed(2)}', 
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
        color: Color(0xffff6161),)

      ),
      Text('Total de ingresos en Ventas',
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

    child: GraphWidget(
      data: widget.daily),

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
}