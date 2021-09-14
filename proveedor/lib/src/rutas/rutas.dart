import 'package:flutter/cupertino.dart';
import 'package:proveedor/src/screens/Agenda/screen_agenda.dart';
import 'package:proveedor/src/screens/Agregar_servicio/screen_agregar.dart';
import 'package:proveedor/src/screens/Descuentos/screen_descuentos.dart';
import 'package:proveedor/src/screens/Mis%20Servicios/screen_mis_servicios.dart';
import 'package:proveedor/src/screens/Perfil/screen_perfil.dart';
import 'package:proveedor/src/screens/historial/screen_historial.dart';
import 'package:proveedor/src/screens/home/home_screen.dart';
import 'package:proveedor/src/screens/login/Login/Screens/login_screen.dart';
import 'package:proveedor/src/screens/login/Screens/Screens.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomeScreen(),
    'home': (BuildContext context) => HomeScreen(),
    'agenda': (BuildContext context) => AgendaScreen(),
    'agregar': (BuildContext context) => AgregarScreen(),
    'descuentos': (BuildContext context) => DescuentosScreen(),
    'historial': (BuildContext context) => HistorialScreen(),
    'servicios': (BuildContext context) => ServiciosScreen(),
    'perfil': (BuildContext context) => PerfilScreen(),
    'servicio': (BuildContext context) => ServiciosEdit(),
    'product': (BuildContext context) => ProductScreen(),
  };
}
