import 'package:flutter/material.dart';

class SearchCardListItem extends StatelessWidget {
  final void Function() onPressed;

  const SearchCardListItem({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      clipBehavior: Clip.hardEdge,
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => onPressed(),
          child: const Padding(
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: Row(
                children: [
                  Image(
                      height: 80,
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi4S-xLqS6-JY3RKY0DyXPYXNiksz0fppfvg&s')),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          'Rome'),
                      Text('Italy')
                    ],
                  )
                ],
              ))),
    );
  }
}
