import 'package:flutter_application_1/views/home.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter_application_1/views/profile.dart';
import 'package:flutter_application_1/views/registration.dart';
import 'package:flutter_application_1/views/settings.dart';
import 'package:flutter_application_1/views/tasks.dart';
import 'package:get/get.dart';

var routes = [
  GetPage(name: "/", page: () => Login()),
  GetPage(name: "/register", page: () => Registration()),
  GetPage(name: "/home", page: () => HomeScreen()),
  GetPage(name: "/profile", page: () => Profile()),
  GetPage(name: "/tasks", page: () => Tasks()),
  GetPage(name: "/settings", page: () => Settings()),
];
