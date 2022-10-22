import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductMainImage extends StatelessWidget {
  const ProductMainImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(blurRadius: 7, color: Colors.grey[600]!),
          ]),
      width: double.infinity,
      height: 200.h,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 100,
            vertical: MediaQuery.of(context).size.height / 100),
        child: Image.asset("assets/images/product.png"),
      ),
    );
  }
}
