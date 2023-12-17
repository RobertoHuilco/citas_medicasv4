import 'package:citas_medicav4/src/page/login.dart';
import 'package:citas_medicav4/src/page/register_doctor.dart';
import 'package:citas_medicav4/src/page/view_doctor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Container(
        color: Colors.lightBlue, // Establecer el color de fondo celeste
        child: Login(), // Coloca aquí el widget principal de tu aplicación
      ),

      // Crear rutas de navegacion[]
      initialRoute: "Login",
      routes: <String, WidgetBuilder>{
        "Login": (BuildContext context) => Login(),
        "Medicos": (BuildContext context) => ViewDoctor(),
        "Registrar": (BuildContext context) => Registro(),
      },
    );
  }
}
// Clockwing
