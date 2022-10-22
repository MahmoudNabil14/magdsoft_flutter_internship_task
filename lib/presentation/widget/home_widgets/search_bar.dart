import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.searchController}) : super(key: key);
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey[600]!.withOpacity(0.9),
            blurRadius: 10,
          ),
        ]),
        child: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 28),
              suffixIcon: const Icon(Icons.search, color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )),
              fillColor: AppColors.white,
              filled: true,
              hintText: "Search",
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 14.sp)),
          onChanged: (value) {},
        ),
      ),
      flex: 6,
    );
  }
}
