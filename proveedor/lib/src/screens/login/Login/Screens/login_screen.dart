import 'package:flutter/material.dart';
import 'package:proveedor/src/screens/login/Login/Provider/Login_provider.dart';
import 'package:proveedor/src/screens/login/Utils/InputDecoracion.dart';
import 'package:proveedor/src/screens/login/Widgets/widgets.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250),
              Carta(
                  child: Column(
                children: [
                  SizedBox(height: 10),
                  Text('Login', style: Theme.of(context).textTheme.headline4),
                  SizedBox(height: 30),
                  ChangeNotifierProvider(
                    create: (_) => LoginProvider(),
                    child: LoginForm(),
                  )
                ],
              )),
              SizedBox(height: 50),
              Text('Registrate como proveedor de servicios',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginProvider>(context);
    return Container(
        child: Form(
            key: loginForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoracion.authInputDecoration(
                    hintText: 'ejemplo@algo.com',
                    labelText: 'Correo electrónico',
                    icono: Icons.alternate_email_sharp),
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El correo que ingresaste no es correcto';
                },
                onChanged: (value) => loginForm.email = value,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoracion.authInputDecoration(
                      hintText: 'password',
                      labelText: 'Contraseña',
                      icono: Icons.password),
                  validator: (value) {
                    if (value != null && value.length >= 6) return null;

                    return 'La contraseña debe tener por lo menos 6 caracteres';
                  },
                  onChanged: (value) => loginForm.password = value),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                  disabledColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                  color: Colors.pink,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(
                        loginForm.cargando ? 'Ingresando' : 'Ingresar',
                        style: TextStyle(color: Colors.white),
                      )),
                  onPressed: loginForm.cargando
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          if (!loginForm.validacion()) return;

                          loginForm.cargando = true;

                          await Future.delayed(Duration(seconds: 2));
                          loginForm.cargando = false;
                          Navigator.popAndPushNamed(context, 'home');
                        })
            ])));
  }
}
