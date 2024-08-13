import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  final void Function()? onBackButtonPressed;
  const GoBackButton({Key? key, this.onBackButtonPressed}) : super(key: key);

  _goBack(BuildContext context) {
    Navigator.pop(context);
    debugPrint('onback tá indo ${onBackButtonPressed != null}');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Color(0xFF7BA6EF),
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => onBackButtonPressed != null
                ? onBackButtonPressed!()
                : _goBack(context),
          ),
        ),
      ),
    );
  }
}
