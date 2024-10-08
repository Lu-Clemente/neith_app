import 'package:flutter/material.dart';

class TravelPlanCardListItem extends StatelessWidget {
  final void Function() onPressed;
  final String name;
  final String description;
  final String photoUrl;

  const TravelPlanCardListItem(
      {super.key,
      required this.onPressed,
      required this.name,
      required this.description,
      required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      clipBehavior: Clip.hardEdge,
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => onPressed(),
          child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LimitedBox(
                          maxWidth: 180,
                          child: Text(
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              name)),
                      LimitedBox(
                        maxWidth: 180,
                        child: Text(description),
                      )
                    ],
                  ),
                  const SizedBox(width: 10),
                  const Image(
                      height: 60,
                      image: AssetImage('assets/recommendationplace.png')),
                ],
              ))),
    );
  }
}
