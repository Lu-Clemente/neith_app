import 'package:flutter/material.dart';

class TravelDaysCarousel extends StatelessWidget {
  final List<String> days;
  final int selectedDay;
  final dynamic onPressed;

  const TravelDaysCarousel({
    super.key,
    required this.days,
    required this.onPressed,
    required this.selectedDay,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: days.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            child: Text(
              days[index],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: selectedDay == index
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
            ),
            onPressed: () => onPressed(index),
          );
        });
  }
}
