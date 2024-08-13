import 'package:flutter/material.dart';

class DropdownController extends ValueNotifier<String?> {
  DropdownController(String? value) : super(value);
}

class NeithSelectField extends StatelessWidget {
  const NeithSelectField({
    Key? key,
    required this.items,
    required this.controller,
    this.hintText,
    this.labelText,
    this.validator,
  }) : super(key: key);

  final List<String> items;
  final DropdownController controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: controller,
      builder: (context, value, child) {
        return DropdownButtonFormField<String>(
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
          onChanged: (value) {
            controller.value = value;
          },
          value: value,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
          ),
          validator: validator,
        );
      },
    );
  }
}
