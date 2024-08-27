import 'package:flutter/material.dart';

class NeithAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final Function onPressed;

  const NeithAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () => onPressed,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
