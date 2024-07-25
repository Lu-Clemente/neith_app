import 'package:flutter/material.dart';

// TextFormField with custom labelText decoration, optional validator, controller and optional obscureText

class NeithTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final bool obscureText;

  const NeithTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xFF49454F),
          ),
          fillColor: const Color(0xFFF2F2F2),
          filled: true,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            bottom: 0.0,
            top: 1.0,
            left: 14,
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
        ),
        validator: validator,
        obscureText: obscureText,
      ),
    );
  }
}
