import 'package:flutter/material.dart';

class AppBarActionButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;

  const AppBarActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFF7BA6EF),
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(40, 40),
        ),
      ),
      icon: Icon(
        icon,
        color: const Color(0xFFFFFFFF),
        size: 24,
      ),
    );
  }
}
