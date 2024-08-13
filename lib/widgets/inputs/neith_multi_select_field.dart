import 'package:flutter/material.dart';

// create a custom multi select field widget. Each item in the list can be selected and deselected. Each item is displayed as a card. The card has a background image and a title at the center of the card. The selected cards have a check icon at the top right corner of the card. The selected cards have a bolder text.

class NeithMultiSelectField extends StatefulWidget {
  const NeithMultiSelectField(
      {super.key, required this.items, required this.onChanged});

  final List<String> items;
  final ValueChanged<List<String>> onChanged;

  @override
  NeithMultiSelectFieldState createState() => NeithMultiSelectFieldState();
}

class NeithMultiSelectFieldState extends State<NeithMultiSelectField> {
  List<String> selectedItems = [];

  @override
  void initState() {
    super.initState();
  }

  void _toggleItem(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
      widget.onChanged(selectedItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.items.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (_, int index) {
          final isSelected = selectedItems.contains(widget.items[index]);
          return SizedBox(
            height: 200,
            child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                    onTap: () => _toggleItem(widget.items[index]),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        const ClipRect(
                          child: Image(
                            image: AssetImage('assets/recommendationplace.png'),
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          color: isSelected
                              ? const Color.fromRGBO(0, 0, 0, 0.7)
                              : const Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                        isSelected
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : Text(
                                widget.items[index],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              )
                      ],
                    ))),
          );
        });
  }
}
