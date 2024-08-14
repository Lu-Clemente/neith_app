import 'package:flutter/material.dart';

class PreferredTimeCardListItem extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final String title;
  final bool isSelected;

  const PreferredTimeCardListItem(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.title,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.blue[200] : Colors.blue[50],
      clipBehavior: Clip.hardEdge,
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => onPressed(),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 24,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LimitedBox(
                          maxWidth: 180,
                          child: Text(title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)))
                    ],
                  )
                ],
              ))),
    );
  }
}
