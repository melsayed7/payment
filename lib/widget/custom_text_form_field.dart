import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  Icon icon;

  String hintText;

  TextEditingController controller;

  String? Function(String?)? validator;

  CustomTextFormField({
    required this.icon,
    required this.hintText,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefixIcon: icon,
          hintText: hintText,
        ),
      ),
    );
  }
}
