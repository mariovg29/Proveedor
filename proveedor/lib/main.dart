import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proveedor/src/rutas/rutas.dart';
import 'package:proveedor/src/screens/home/home_screen.dart';
import 'package:proveedor/src/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor:
            Color(0xffff6161), // navigation bar color
        statusBarColor: Color(0xffff6161) // status bar color
        ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: getAplicationRoutes(),

      //  routes: {
      //    '/': (BuildContext context ){
      //      if(_loggedin){
      //      return HomeScreen(
      //         logoutSuccess: (){
      //           setState(() {
      //           _loggedin=false;
      //                         });
      //         },

      //      );
      //      } else {
      //       return LoginScreen(
      //         loginSuccess: (){
      //           setState(() {
      //           _loggedin=true;
      //                         });
      //         },
      //       );

      //      }
      //    }
      //  },
    );
  }
}
