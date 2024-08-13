import 'package:flutter/material.dart';

// TextFormField with custom labelText decoration, optional validator, controller and optional obscureText

class NeithTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final bool? isPassword;

  const NeithTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.isPassword = false,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  State<NeithTextField> createState() => _NeithTextFieldState();
}

class _NeithTextFieldState extends State<NeithTextField> {
  bool _passwordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: Color(0xFF49454F),
          ),
          fillColor: const Color(0xFFF2F2F2),
          filled: true,
          border: InputBorder.none,
          suffixIcon: widget.isPassword!
              ? IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    togglePasswordVisibility();
                  },
                )
              : null,
        ),
        style: const TextStyle(
          fontSize: 16,
        ),
        validator: widget.validator,
        obscureText: widget.isPassword! ? !_passwordVisible : false,
      ),
    );
  }
}
