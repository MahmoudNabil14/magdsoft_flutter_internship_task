import 'package:flutter/material.dart';

import '../../widget/product overview widgets/product_sub_image.dart';

class ProductSubImagesList extends StatelessWidget {
  const ProductSubImagesList({Key? key, required this.productSubImagePathList})
      : super(key: key);
  final List<String> productSubImagePathList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 7.7,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 85,
                    vertical: MediaQuery.of(context).size.height / 85),
                child: ProductSubImage(
                  imagePath: productSubImagePathList[index],
                ));
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: MediaQuery.of(context).size.width / 41,
            );
          },
          itemCount: 4),
    );
  }
}
