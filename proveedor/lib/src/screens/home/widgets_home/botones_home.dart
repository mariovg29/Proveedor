import 'package:flutter/material.dart';

class BotonesHome extends StatelessWidget {

  const BotonesHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Table(
      children: [
        TableRow(
          children: [
            _BotonesCard(color: Colors.purple, icon: Icons.history , text: 'Historial',ruta: 'historial'),
            _BotonesCard(color: Colors.teal, icon: Icons.money_off , text: 'Descuentos',ruta: 'descuentos'),
            _BotonesCard(color: Colors.blue, icon: Icons.verified_user , text: 'Mi Perfil',ruta: 'perfil')
          ]
        ),
        TableRow(
          children: [
            _BotonesCard(color: Colors.black, icon: Icons.view_agenda, text: 'Agenda',ruta: 'agenda'),
            _BotonesCard(color: Colors.indigo, icon: Icons.design_services, text: 'Mis Servicios',ruta: 'servicios'),
            _BotonesCard(color: Colors.green, icon: Icons.add, text: 'Agregar Servicio',ruta: 'agregar')
         ]
        ),    
      ],
    );    
  }
}
class _BotonesCard extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String text;
  final String ruta;

  const _BotonesCard({Key? key,
   required this.icon,
   required this.color,
   required this.text,
   required this.ruta,

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;     

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, this.ruta);
      },
      child: Container(
          margin: EdgeInsets.all(4),
          height: height* .11,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromRGBO(255, 182, 193, .7)
            
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: this.text,
                  child: CircleAvatar(
                    backgroundColor: this.color,
                    child: Icon(this.icon, size: height*.05,),
                    radius: height*.033,
                  ),
                ),
                SizedBox(height: 10),
                Text(this.text, 
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          
        ),
    );
  }
}