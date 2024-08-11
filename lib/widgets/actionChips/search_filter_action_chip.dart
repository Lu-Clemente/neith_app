import 'package:flutter/material.dart';
import 'package:neith/views/search/search_view.dart';

class SearchFilterActionChip extends StatelessWidget {
  final FilterValues searchFilter;
  final FilterValues choosedSearchFilter;
  final void Function() onPressed;
  final String label;
  const SearchFilterActionChip(
      {required this.onPressed,
      required this.searchFilter,
      required this.label,
      required this.choosedSearchFilter,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onPressed,
      label: Text(label),
      labelStyle: TextStyle(
        color:
            searchFilter == choosedSearchFilter ? Colors.white : Colors.black,
      ),
      backgroundColor: searchFilter == choosedSearchFilter
          ? Colors.blue
          : Colors.transparent,
      shape: const StadiumBorder(side: BorderSide(color: Colors.blue)),
      avatar: Icon(
        Icons.local_taxi,
        color: searchFilter == choosedSearchFilter
            ? Colors.white
            : Colors.blue[400],
      ),
    );
  }
}
