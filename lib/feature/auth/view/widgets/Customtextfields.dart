// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Customtfield extends StatelessWidget {
  final TextEditingController controller;

  final String label;

  final String hint;

  final IconData perfix;

  final String? Function(String?)? validator;

  final TextInputType textInputType;

  final Widget? suffix;

  final bool obscureText;

  const Customtfield({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.perfix,
    this.validator,
    required this.textInputType,
    this.suffix,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(perfix),
        suffixIcon: suffix,
      ),
      validator: validator,
      keyboardType: textInputType,
      obscureText: obscureText,
    );
  }
}
