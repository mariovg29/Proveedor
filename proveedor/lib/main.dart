import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proveedor/src/rutas/rutas.dart';
import 'package:proveedor/src/screens/home/home_screen.dart';
import 'package:proveedor/src/screens/login/login_screen.dart';
import 'package:proveedor/src/screens/login/services/services.dart';
import 'package:proveedor/src/screens/login_mario/login_screen.dart';
import 'package:proveedor/src/screens/login_mario/login_state.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Services())],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xffff6161), // navigation bar color
        statusBarColor: Color(0xffff6161) // status bar color
        ));

    return ChangeNotifierProvider<LoginState>(
      create: (_)=>LoginState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialRoute: 'login',
        routes: {'/': (BuildContext context){
          var state= Provider.of<LoginState>(context);
          if(state.isLoggedIn()){
            return HomeScreen();
          }else{
            return LoginScreen2();
          }
        }}
        //routes: getAplicationRoutes(),
    
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
      ),
    );
  }
}
