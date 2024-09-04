import 'package:flutter/material.dart';
import 'package:neith/widgets/actionChips/time_action_chips.dart';

class TravelDetailCard extends StatelessWidget {
  const TravelDetailCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.time,
  });

  final String title;
  final String subtitle;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 2,
      child: Row(
        children: [
          const Icon(
            Icons.arrow_drop_down,
            size: 32,
          ),
          Expanded(
            child: ListTile(
              title: Text(title),
              subtitle: Text(
                subtitle,
              ),
            ),
          ),
          time != null ? TimeActionChip(time: time) : const SizedBox(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
