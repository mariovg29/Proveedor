import 'package:flutter/material.dart';
import 'package:proveedor/src/screens/home/widgets_home/botones_home.dart';



class BienvenidaHome extends StatelessWidget {
  const BienvenidaHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
     double witdh = MediaQuery.of(context).size.width;
    return SafeArea(
      child:Column(            
            children: [
              Container(
                height: height*.10,
                child: Row(
                children:[
                  Container(
                padding: EdgeInsets.all(15),      
                
                width:witdh*.8,
                
                child: Column(                
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text('Bienvenid@', 
                    style: TextStyle(
                      fontSize: height*.017, fontWeight: FontWeight.bold, color: Colors.white)),

                      SizedBox(height: height*.009
                      ,),
                      
                    Text('Nombre de Usuario', 
                    style: TextStyle(
                      fontSize: height*.025, fontWeight: FontWeight.bold, color: Colors.white) )
                  ],
                ),
                

              ),
              Container(
                width:witdh*.2,
                padding: EdgeInsets.only(right: 15), 
                
                child: CircleAvatar(
                  radius: height*.04,
                  backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2016/03/27/21/15/woman-1284304_960_720.jpg'),

                ),


              ),
                ]
                

                
              ) 
              ),
              Container(
                height: height*.20,
                child: BotonesHome(),
              )
              
              
              
            ],
           
            
          ),
          
        
        
      
       
        
        
      
    );
  }
}