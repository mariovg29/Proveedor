import 'package:flutter/material.dart';


class BackgroundHome extends StatelessWidget {
  const BackgroundHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          color: Color(0xffff6161),
          height: height*.35,
          width: width,
         

        )
      ],
      
    );
  }
}