import 'package:flutter/material.dart';
import 'package:proveedor/src/screens/home/home_screen.dart';
import 'package:proveedor/src/screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _loggedin = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
     routes: {
       '/': (BuildContext context ){
         if(_loggedin){
         return HomeScreen(
            logoutSuccess: (){
              setState(() {
              _loggedin=false;
                            });
            },
           
         );
         } else {
          return LoginScreen(
            loginSuccess: (){
              setState(() {
              _loggedin=true;
                            });
            },
          );

         }
       }       
     },
    );
  }
}

