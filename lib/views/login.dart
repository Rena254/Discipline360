import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
var store = GetStorage();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    usernameController.text = store.read("username") ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text("Discipline360"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.amberAccent,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.access_time)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/discipline.png", height: 200, width: 400),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Username:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Password:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () async {
                    try {
                      var response = await http.get(
                        Uri.parse(
                          "http://localhost/discipline/login.php?username=${usernameController.text}&password=${passwordController.text}",
                        ),
                      );

                      if (response.statusCode == 200) {
                        var responseBody = jsonDecode(response.body);
                        int loggedIn = responseBody['success'];

                        if (loggedIn == 1) {
                          var user = responseBody['data'][0];

                          store.write("fname", user['fname']);
                          store.write("lname", user['lname']);
                          store.write("email", user['email']);
                          store.write("phone", user['phone']);
                          store.write("image", user['picture']);
                          store.write("username", user['username']);
                          store.write("userID", user['id']);

                          print("LOGIN DATA: $user");
                          print("STORED IMAGE: ${store.read("image")}");

                          Get.snackbar("Success", "Login successful!");

                          Get.toNamed("/home");
                        } else {
                          Get.snackbar("Error", "Invalid username or password");
                        }
                      } else {
                        Get.snackbar(
                          "Error",
                          "Server error: ${response.statusCode}",
                        );
                      }
                    } catch (e) {
                      Get.snackbar("Error", "Could not connect to the server");

                      print(e);
                    }
                  },
                  color: primaryColor,
                  height: 45,
                  minWidth: 200,
                  child: Text("Login", style: TextStyle(color: secondaryColor)),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                    "Not Registered? Sign Up",
                    style: TextStyle(color: primaryColor),
                  ),
                  onTap: () {
                    Get.toNamed("/register");
                  },
                ),
                Spacer(),
                Text(
                  "Forgot Password? Reset",
                  style: TextStyle(color: primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
