import 'package:flutter/material.dart';
import 'package:neith/widgets/buttons/neith_text_button.dart';

class RecentTravelPlansCarousel extends StatelessWidget {
  final VoidCallback startTravelPlan;

  const RecentTravelPlansCarousel({super.key, required this.startTravelPlan});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 2,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 290,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      image: AssetImage('assets/recommendationplace.png'),
                      width: 250,
                    ),
                    const Text(
                      'Rome',
                      style: TextStyle(
                          color: Color.fromRGBO(31, 27, 89, 1),
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage('assets/icon/gmail_groups.png'),
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 6),
                            Text(
                              '4 people',
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                              image: AssetImage('assets/icon/today.png'),
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 6),
                            Text(
                              '7 days',
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                              image: AssetImage('assets/icon/schedule.png'),
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 6),
                            Text(
                              '12PM - 7PM',
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                      ],
                    ),
                    NeithTextButton(
                        onPressed: () => startTravelPlan(),
                        label: 'Start travel plan')
                  ],
                ),
              ),
            ),
          );
        });
  }
}
