import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

bool isRegistering = false;

TextEditingController fullnameController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController dobController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discipline360"),
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.account_box))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            Center(
              child: Text(
                "REGISTER",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Full Name",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextField(
              controller: fullnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Username",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.alternate_email),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Date of Birth",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextField(
              controller: dobController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_month),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Phone Number",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Email",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Password",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Confirm Password",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextField(
              controller: confirmPasswordController,
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
                  onPressed: isRegistering
                      ? null
                      : () async {
                          if (fullnameController.text.isEmpty ||
                              usernameController.text.isEmpty ||
                              dobController.text.isEmpty ||
                              phoneController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              confirmPasswordController.text.isEmpty) {
                            Get.snackbar("Error", "Please fill in all fields");
                            return;
                          }

                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            Get.snackbar("Error", "Passwords do not match");
                            return;
                          }

                          setState(() {
                            isRegistering = true;
                          });

                          try {
                            var url = Uri.http(
                              "localhost",
                              "/discipline/create_user.php",
                              {
                                "fullname": fullnameController.text,
                                "username": usernameController.text,
                                "dob": dobController.text,
                                "phone": phoneController.text,
                                "email": emailController.text,
                                "password": passwordController.text,
                              },
                            );

                            var response = await http.get(url);

                            if (response.statusCode == 200) {
                              var responseBody = jsonDecode(response.body);

                              if (responseBody['success'] == 1) {
                                setState(() {
                                  isRegistering = false;
                                });

                                Get.snackbar(
                                  "Success",
                                  "Registration successful!",
                                );

                                Get.toNamed("/login");
                              } else {
                                setState(() {
                                  isRegistering = false;
                                });

                                Get.snackbar("Error", "Registration failed");
                              }
                            } else {
                              setState(() {
                                isRegistering = false;
                              });

                              Get.snackbar(
                                "Error",
                                "Server error: ${response.statusCode}",
                              );
                            }
                          } catch (e) {
                            setState(() {
                              isRegistering = false;
                            });

                            Get.snackbar(
                              "Error",
                              "Could not connect to the server",
                            );

                            print(e);
                          }
                        },
                  color: primaryColor,
                  textColor: secondaryColor,
                  height: 45,
                  minWidth: 200,
                  child: isRegistering
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: secondaryColor,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("Registering..."),
                          ],
                        )
                      : Text("Register", selectionColor: secondaryColor),
                ),
              ],
            ),

            SizedBox(height: 20),

            Padding(
              padding: EdgeInsetsGeometry.directional(bottom: 20),
              child: Center(
                child: Text(
                  "Already one of us? Login here",
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
