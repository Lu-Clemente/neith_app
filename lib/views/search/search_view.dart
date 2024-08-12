import 'package:flutter/material.dart';
import 'package:neith/services/search.dart';
import 'package:neith/views/place/place_details_view.dart';
import 'package:neith/widgets/actionChips/search_filter_action_chip.dart';
import 'package:neith/widgets/inputs/neith_search_field.dart';
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
  Iterable<SearchPlace> searchPlaces = [];
  FilterValues _searchFilter = FilterValues.places;
  bool isLoading = false;

  handleSearchSubmit(String searchValue) async {
    if (searchValue.isEmpty) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    debugPrint('search: $searchValue');

    final search = await fetchSearch(searchValue.toLowerCase());

    setState(() {
      searchPlaces = search;
      isLoading = false;
    });
  }

  _handleActionClick(FilterValues filter) {
    if (filter == _searchFilter) {
      return;
    }

    setState(() {
      _searchFilter = filter;
    });
  }

  _handleCardClick(int index) {
    debugPrint('Card $index');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceDetailsView(
          place: searchPlaces.elementAt(index),
        ),
      ),
    );
  }

  Widget _loadingObj() {
    return isLoading ? const CircularProgressIndicator() : Container();
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
                      onFieldSubmitted: handleSearchSubmit,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
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
        _loadingObj(),
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
                            name: searchPlaces.elementAt(index).name,
                            photoUrl: searchPlaces.elementAt(index).photoUrl,
                            shortFormattedAddress: searchPlaces
                                .elementAt(index)
                                .shortFormattedAddress,
                            onPressed: () => _handleCardClick(index)));
                  },
                  childCount: searchPlaces.length,
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
