import 'package:flutter/material.dart';

class SwitchController extends ValueNotifier<bool> {
  SwitchController(bool value) : super(value);
}

class NeithSwitchField extends StatelessWidget {
  const NeithSwitchField({
    Key? key,
    required this.controller,
    this.labelText,
  }) : super(key: key);

  final SwitchController controller;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (labelText != null) Text(labelText!),
            Switch(
              value: value,
              onChanged: (newValue) {
                controller.value = newValue;
              },
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              activeColor: const Color(0xFF7BA6EF),
              inactiveTrackColor: const Color(0xFFE5E5E5),
            ),
          ],
        );
      },
    );
  }
}
