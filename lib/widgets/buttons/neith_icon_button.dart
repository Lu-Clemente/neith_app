import 'package:flutter/material.dart';

class NeithIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  final String label;
  final Color textColor;
  final Color backgroundColor;

  const NeithIconButton({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.label,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            height: 32.0,
            width: 32.0,
          ),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: textColor,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              textStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
