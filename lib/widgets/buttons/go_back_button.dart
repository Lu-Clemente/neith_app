import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  final void Function()? onPressed;

  const GoBackButton({
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFF7BA6EF),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ), // Change this to your desired icon
        onPressed: () {
          // Handle icon button press
          print('Circular icon pressed');
        },
      ),
    );
  }
}
