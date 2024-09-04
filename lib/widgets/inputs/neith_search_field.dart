import 'package:flutter/material.dart';

class NeithSearchField extends StatefulWidget {
  final bool? readOnly;
  final TextEditingController controller;
  final void Function(String value) onFieldSubmitted;
  const NeithSearchField(
      {super.key,
      required this.controller,
      required this.onFieldSubmitted,
      this.readOnly = false});

  @override
  NeithSearchFieldState createState() => NeithSearchFieldState();
}

class NeithSearchFieldState extends State<NeithSearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.readOnly as bool,
        onFieldSubmitted: (value) => widget.onFieldSubmitted(value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
            labelText: 'Search',
            labelStyle: const TextStyle(
              color: Color(0xFF49454F),
            ),
            fillColor: const Color(0xFFF2F2F2),
            filled: true,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(
              bottom: 0.0,
              top: 1.0,
              left: 14,
            ),
            suffixIcon: IconButton(
                onPressed: () =>
                    widget.onFieldSubmitted(widget.controller.value.text),
                icon: const Icon(Icons.search))),
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
