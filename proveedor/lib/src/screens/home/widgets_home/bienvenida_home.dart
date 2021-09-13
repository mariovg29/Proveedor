import 'package:flutter/material.dart';




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
                margin: EdgeInsets.only(right: 5,left: 5,top:5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),color: Colors.white12),
                
                height: height*.10,
                child: Row(
                children:[

                  Container(
                    
                    padding: EdgeInsets.all(10),                         
                    width:witdh*.75,                    
                    child: Column(     

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Bienvenid@', 
                        style: TextStyle(
                              fontSize: height*.014, fontWeight: FontWeight.bold, color: Colors.white)),    
                          SizedBox(height: height*.009
                          ,),
                      
                        Text('Nombre de Usuario', 
                        style: TextStyle(
                          fontSize: height*.020, fontWeight: FontWeight.bold, color: Colors.white) )
                      ],
                    ),
                

              ),

              Expanded(
                child: Container(
                                   
                  child: Center(
                    child: CircleAvatar(
                      radius: height*.04,
                      backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2016/03/27/21/15/woman-1284304_960_720.jpg'),

                    ),
                  ),
                ),
              ),
                ] 
              ) 
              ),
            ],
           
            
          ),    
    );
  }
}