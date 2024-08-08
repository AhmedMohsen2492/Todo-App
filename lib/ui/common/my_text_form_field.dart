import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  TextEditingController controller;
  String? hintText;

  String? labelText;

  MyTextFormField({super.key, this.hintText, this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {},
      onFieldSubmitted: (value) {
        print(controller.text);
        print(value);
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
