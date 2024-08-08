import 'package:flutter/material.dart';
import 'package:neith/widgets/actionChips/search_filter_action_chip.dart';
import 'package:neith/widgets/inputs/neith_search_field.dart';
// import 'package:neith/widgets/buttons/neith_text_button.dart';
// import 'package:neith/widgets/inputs/neith_text_field.dart';
import 'package:neith/widgets/layout.dart';
import 'package:neith/widgets/lists/search_card_list_item.dart';

enum FilterValues { restaurants, places }

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  FilterValues _searchFilter = FilterValues.restaurants;

  handleSearchSubmit(String searchValue) {
    if (searchValue.isEmpty) {
      return;
    }
    debugPrint('search: $searchValue');
  }

  _handleActionClick(FilterValues filter) {
    if (filter == _searchFilter) {
      return;
    }

    setState(() {
      _searchFilter = filter;
    });
    debugPrint('filter changed: $filter');
  }

  _handleCardClick(int index) {
    debugPrint('Card $index');
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        body: Column(
      children: [
        Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Search for new places',
                      style: TextStyle(
                          color: Color.fromRGBO(31, 27, 89, 1),
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    NeithSearchField(
                      controller: _searchController,
                      onPressed: handleSearchSubmit,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SearchFilterActionChip(
                            onPressed: () =>
                                _handleActionClick(FilterValues.restaurants),
                            searchFilter: _searchFilter,
                            label: 'Restaurants',
                            choosedSearchFilter: FilterValues.restaurants),
                        const SizedBox(width: 10),
                        SearchFilterActionChip(
                            onPressed: () =>
                                _handleActionClick(FilterValues.places),
                            searchFilter: _searchFilter,
                            label: 'Places',
                            choosedSearchFilter: FilterValues.places),
                      ],
                    ),
                  ],
                ),
              ],
            )),
        const SizedBox(height: 20),
        Expanded(
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    double topPadding = index != 0 ? 10 : 0;

                    return Padding(
                        padding: EdgeInsets.only(top: topPadding),
                        child: SearchCardListItem(
                            onPressed: () => _handleCardClick(index)));
                  },
                  childCount: 15,
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
