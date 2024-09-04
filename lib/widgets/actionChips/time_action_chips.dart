import 'package:flutter/material.dart';

class TimeActionChip extends StatelessWidget {
  const TimeActionChip({
    super.key,
    required this.time,
  });

  final String? time;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: const Icon(Icons.schedule),
      label: Text(time!),
      onPressed: () {},
      shape: const StadiumBorder(),
      labelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      backgroundColor: Colors.grey[300],
      side: const BorderSide(
        style: BorderStyle.none,
      ),
    );
  }
}
