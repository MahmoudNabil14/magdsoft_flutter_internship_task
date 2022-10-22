import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home views/home_bottom_nav_bar.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home views/search_and_filter.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shared%20widgets/shared_widgets.dart';

import '../../view/home views/filter_choices_list.dart';
import '../../view/home views/new_release_images_list.dart';
import '../../widget/home_widgets/products_grid_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  final List<String> _filterChoicesNameList = ['All', 'Acer', 'Razer', 'Apple'];
  final List<String> _filterChoicesImagesPathList = [
    'assets/images/cup.png',
    'assets/images/acer.png',
    'assets/images/razer.png',
    'assets/images/apple.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradiantBackground(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  SearchAndFilter(searchController: searchController),
                  const NewReleaseImagesList(),
                  FilterChoicesList(
                      filterChoicesImages: _filterChoicesImagesPathList,
                      filterChoicesNames: _filterChoicesNameList),
                  const SizedBox(
                    height: 10,
                  ),
                  const ProductsGridView(),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor.withOpacity(0.8),
          child: const Icon(Icons.home),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const HomeBottomNavBar());
  }
}
