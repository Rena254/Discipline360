import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

class Mavuno extends StatefulWidget {
  const Mavuno({super.key});

  @override
  State<Mavuno> createState() => _MavunoState();
}

class _MavunoState extends State<Mavuno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mavuno 360"),
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
      body: Column(
        children: [
          Image.asset("assets/mavuno.png", height: 100, width: 200),
          Text(
            "Username:",
            style: TextStyle(
              fontSize: 20,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(),
          SizedBox(height: 20),
          Text(
            "Password:",
            style: TextStyle(
              fontSize: 20,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () {},
            color: primaryColor,
            focusElevation: 200,
            splashColor: const Color.fromARGB(255, 59, 192, 123),
            textColor: secondaryColor,
            child: Text("Ingia Ndani"),
          ),
        ],
      ),
    );
  }
}
