
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proveedor/src/screens/historial/widgets_historial/month_widget_historial.dart';

class HistorialScreen extends StatefulWidget {
  const HistorialScreen({Key? key}) : super(key: key);
  

  @override
  _HistorialScreenState createState() => _HistorialScreenState();
}

class _HistorialScreenState extends State<HistorialScreen> {

  

  final PageController _monthController = PageController();
  int currentPage = 7;
   
  
  @override
  void initState() {
    _monthController.dispose();
    super.initState();
  
  }
 
  
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
     
  final Stream<QuerySnapshot<Object?>> 
  _query = FirebaseFirestore
  .instance
  .collection('Ventas').where("mes",isEqualTo: currentPage+1)
  .snapshots();

    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            _selector(),
            StreamBuilder<QuerySnapshot>(
              stream: _query,
              
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if (snapshot.hasData){
                return MonthWidgetHistorial(
                  ventas: snapshot.data!.docs,
                 
                 );
                }
                return Center(
                  child: CircularProgressIndicator(color:Colors.pink));
              }
            
            ),
          ]
        ),
      ),

    );
  }


Widget _pageItem(String nombreMes, int position){
  var _alignment;
  //int currentPage=7;

  final selected = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: Colors.pink,
  );
  final unselected= TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
    color: Colors.blueGrey,
  );


  if(position == currentPage){
    _alignment = Alignment.center;
  }
  else if(position>currentPage){
    _alignment=Alignment.centerRight;
  }else{
    _alignment =Alignment.centerLeft;
  }
  return Align(
    alignment: _alignment,
    child: Text(nombreMes,
    style: position==currentPage? selected : unselected,)
    );
}

Widget _selector ()
{  
  
  
   final PageController _monthController = PageController(
     initialPage: 7,
     viewportFraction: 0.35
   );


  
  return SizedBox.fromSize(
    size:Size.fromHeight(80),
    child: PageView(
      onPageChanged: (newPage){ 
        
        setState(() {
        currentPage= newPage;       
        
                });
       
          

       

      },
      controller: _monthController,
      children:<Widget>[
        _pageItem('Enero', 0),
        _pageItem('Febrero', 1),
        _pageItem('Marzo', 2),
        _pageItem('Abril', 3),
        _pageItem('Mayo', 4),
        _pageItem('Junio', 5),
        _pageItem('Julio', 6),
        _pageItem('Agosto', 7),
        _pageItem('Septiembre', 8),
        _pageItem('Octubre', 9),
        _pageItem('Noviembre', 10),
        _pageItem('Diciembre', 11),

       
      ],     
       
    ),
  );
}






}