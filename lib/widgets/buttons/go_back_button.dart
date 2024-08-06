import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    Key? key,
  }) : super(key: key);

  _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _goBack(context),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFF7BA6EF),
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(10, 10),
        ),
      ),
      icon: const Icon(
        Icons.arrow_back,
        color: Color(0xFFFFFFFF),
        size: 24,
      ),
    );
  }
}
