import 'package:flutter/material.dart';

enum NeithTextButtonVariant {
  primary,
  secondary,
}

class NeithTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final NeithTextButtonVariant? variant;

  const NeithTextButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.variant = NeithTextButtonVariant.primary,
  }) : super(key: key);

  ButtonStyle _getBgButtonStyle() {
    switch (variant) {
      case NeithTextButtonVariant.primary:
        return ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            const Color(0xFF1F1B59),
          ),
        );
      case NeithTextButtonVariant.secondary:
        return ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Colors.white,
          ),
        );
      default:
        return ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            const Color(0xFF1F1B59),
          ),
        );
    }
  }

  TextStyle _getTextButtonStyle() {
    switch (variant) {
      case NeithTextButtonVariant.primary:
        return const TextStyle(
          color: Colors.white,
        );
      case NeithTextButtonVariant.secondary:
        return const TextStyle(
          color: Color(0xFF1F1B59),
        );
      default:
        return const TextStyle(
          color: Colors.white,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: variant == NeithTextButtonVariant.secondary
            ? Border.all(
                color: const Color(0xFF1F1B59),
                width: 1,
              )
            : null,
      ),
      child: TextButton(
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all(
            const Size(double.infinity, 48),
          ),
        ).merge(
          _getBgButtonStyle(),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: _getTextButtonStyle(),
        ),
      ),
    );
  }
}
