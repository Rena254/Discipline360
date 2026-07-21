import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/routes.dart';
import 'package:flutter_application_1/views/login.dart';
// ignore: unused_import
import 'package:flutter_application_1/views/registration.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(Linka());
}

class Linka extends StatefulWidget {
  const Linka({super.key});

  @override
  State<Linka> createState() => _LinkaState();
}

class _LinkaState extends State<Linka> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      initialRoute: "/",
      getPages: routes,
    );
  }
}
