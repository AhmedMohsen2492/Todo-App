import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {

  String? hintText ;
  MyTextFormField({this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
