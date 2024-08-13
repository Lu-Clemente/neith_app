import 'package:flutter/material.dart';

class CustomAppBarLabel extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomAppBarLabel({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1F1B59),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF1F1B59),
          ),
        ),
      ],
    );
  }
}
