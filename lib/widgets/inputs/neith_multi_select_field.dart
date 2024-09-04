import 'package:flutter/material.dart';

// create a custom multi select field widget. Each item in the list can be selected and deselected. Each item is displayed as a card. The card has a background image and a title at the center of the card. The selected cards have a check icon at the top right corner of the card. The selected cards have a bolder text.

class NeithMultiSelectField extends StatefulWidget {
  const NeithMultiSelectField({
    Key? key,
    required this.items,
    required this.onChanged,
    this.selectedItems = const [],
  }) : super(key: key);

  final List<String> items;
  final List<String> selectedItems;
  final ValueChanged<List<String>> onChanged;

  @override
  _NeithMultiSelectFieldState createState() => _NeithMultiSelectFieldState();
}

class _NeithMultiSelectFieldState extends State<NeithMultiSelectField> {
  List<String> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.selectedItems;
  }

  void _toggleItem(String item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
      widget.onChanged(_selectedItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: widget.items.map((item) {
        final isSelected = _selectedItems.contains(item);

        return GestureDetector(
          onTap: () => _toggleItem(item),
          child: Card(
            color: isSelected ? Theme.of(context).primaryColor : null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    item,
                    style: TextStyle(
                      color: isSelected ? Colors.white : null,
                      fontWeight: isSelected ? FontWeight.bold : null,
                    ),
                  ),
                  if (isSelected)
                    const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
