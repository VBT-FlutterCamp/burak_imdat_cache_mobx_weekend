import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key, required this.hint, required this.controller, this.isPassword}) : super(key: key);
  final String hint;
  final TextEditingController controller;
  final bool? isPassword;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.onSurface),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.onSurface),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colorScheme.primary,
            width: 3,
          ),
        ),
        hintText: hint,
      ),
      obscureText: isPassword ?? false,
    );
  }
}
