import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_flutter_structure/business_logic/home%20cubit/home_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/home%20cubit/home_states.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shared%20widgets/shared_widgets.dart';

import '../../view/home views/product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetProductsSuccessState) {
            return StaggeredGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 25,
              children: [
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                    child: Text(
                      "Recommended \nFor You",
                      softWrap: false,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(0xff464646),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                  ),
                ),
                for (var product in state.productsList)
                  ProductCard(
                    productModel: product,
                  ),
              ],
            );
          } else if (state is GetProductsErrorState) {
            return NetworkErrorWidget(errorMessage: state.errorMessage);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
