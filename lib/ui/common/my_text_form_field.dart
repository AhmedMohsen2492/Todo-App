import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {

  TextEditingController controller;
  String? hintText ;

  MyTextFormField({this.hintText ,required this.controller });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
