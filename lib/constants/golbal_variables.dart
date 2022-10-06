import 'package:flutter/material.dart';

String uri = 'http://192.168.0.153:3000';

class GlobalVariables {
  static const AppbarGradient = LinearGradient(colors: [
    Color.fromARGB(225, 29, 201, 192),
    Color.fromARGB(225, 125, 221, 216),
  ], stops: [
    0.5,
    1.0
  ]);

  static const secondaryColor = Color.fromRGBO(225, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const greyBackgroundColor = Color(0xffebecee);
  static var selectedNavbarColor = Colors.cyan[800];
  static const unselectedNavbarColor = Colors.black87;
}
