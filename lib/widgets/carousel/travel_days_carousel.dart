import 'package:flutter/material.dart';

class TravelDaysCarousel extends StatelessWidget {
  final List<String> days;

  const TravelDaysCarousel({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: days.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            child: Text(
              days[index],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {
              print('Day ${index + 1}');
            },
          );
        });
  }
}
