import 'package:flutter/material.dart';

class NeithSeparator extends StatelessWidget {
  final String label;

  const NeithSeparator({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const Divider(
              color: Color.fromRGBO(69, 90, 100, 0.5),
              thickness: 1,
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Color.fromRGBO(69, 90, 100, 0.5),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: const Divider(
              color: Color.fromRGBO(69, 90, 100, 0.5),
              thickness: 1,
            ),
          ),
        ),
      ],
    );
  }
}
