import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductName extends StatelessWidget {
  const ProductName({Key? key, required this.productName}) : super(key: key);
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.bold, fontSize: 23.sp),
    );
  }
}
