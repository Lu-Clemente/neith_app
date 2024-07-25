import 'package:flutter/material.dart';

class NeithTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color textColor;
  final Color backgroundColor;

  const NeithTextButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.textColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: TextButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
            const Size(double.infinity, 48),
          ),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
