import 'package:flutter/material.dart';

class SearchCardListItem extends StatelessWidget {
  final void Function() onPressed;
  final String name;
  final String shortFormattedAddress;
  final String photoUrl;

  const SearchCardListItem(
      {super.key,
      required this.onPressed,
      required this.name,
      required this.shortFormattedAddress,
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
                right: 20,
              ),
              child: Row(
                children: [
                  Image(width: 120, image: NetworkImage(photoUrl)),
                  const SizedBox(width: 10),
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
                        child: Text(shortFormattedAddress),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
