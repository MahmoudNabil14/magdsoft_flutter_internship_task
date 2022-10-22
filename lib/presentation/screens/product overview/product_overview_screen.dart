import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/view/product%20overview%20views/product_details_tab_bar.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/product%20overview%20widgets/back_arrow.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/product%20overview%20widgets/product_main_image.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/product%20overview%20widgets/product_type.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shared%20widgets/shared_widgets.dart';

import '../../view/product overview views/price_and_cart_button.dart';
import '../../view/product overview views/product_sub_images_list.dart';
import '../../view/product overview views/product_tab_bar_view.dart';
import '../../view/product overview views/store_info.dart';
import '../../widget/product overview widgets/product_name.dart';

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;

  @override
  State<ProductOverviewScreen> createState() =>
      _ProductOverviewScreenState(productModel: productModel);
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen>
    with TickerProviderStateMixin {
  final ProductModel productModel;
  final List<String> _productSubImagePathList = [
    'assets/images/pederator2.jpg',
    'assets/images/predator.png',
    'assets/images/product.png',
    'assets/images/pederator2.jpg',
  ];

  _ProductOverviewScreenState({required this.productModel});

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: GradiantBackground(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20.5,
                ),
                const BackArrow(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 41,
                ),
                ProductName(productName: productModel.productModel),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 82,
                ),
                ProductType(productType: productModel.productType),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                const ProductMainImage(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                ProductSubImagesList(
                  productSubImagePathList: _productSubImagePathList,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                const StoreInfo(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20.5,
                ),
                PriceAndCartButton(
                  productPrice: productModel.productPrice,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 16.5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 20),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                ProductDetailsTabBar(tabController: tabController),
                ProductDetailsTabBarView(
                  tabController: tabController,
                  productDescription: productModel.productDescription,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
