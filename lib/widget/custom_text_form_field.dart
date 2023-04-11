import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  Icon icon;

  String hintText;

  TextEditingController controller;

  String? Function(String?)? validator;

  TextInputType inputType;

  CustomTextFormField({
    required this.icon,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefixIcon: icon,
          hintText: hintText,
        ),
      ),
    );
  }
}
