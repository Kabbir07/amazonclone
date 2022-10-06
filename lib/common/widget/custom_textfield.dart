import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextFiled(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "Enter Your $hintText";
        }
        return null;
      },
    );
  }
}
