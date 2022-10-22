import 'package:flutter/material.dart';

import '../../widget/home_widgets/filter_button.dart';
import '../../widget/home_widgets/search_bar.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({Key? key, required this.searchController})
      : super(key: key);
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchBar(
            searchController: searchController,
          ),
          const SizedBox(
            width: 10.0,
          ),
          const FilterButton(),
        ],
      ),
    );
  }
}
