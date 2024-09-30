import 'package:flutter/material.dart';
import '../utils/helper_functions.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String fieldType; // Field type for validation
  final double borderWidth;
  final bool obscureText; // For password fields

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.fieldType, // Pass the field type
    this.borderWidth = 0.5,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) =>
          universalValidator(value, fieldType),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey, // Border color
            width: borderWidth, // Border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.blue, // Border color when focused
            width: borderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey, // Border color when enabled
            width: borderWidth,
          ),
        ),
      ),
    );
  }
}
