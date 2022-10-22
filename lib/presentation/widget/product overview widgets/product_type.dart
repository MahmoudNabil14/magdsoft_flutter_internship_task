import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';

class ProductType extends StatelessWidget {
  const ProductType({Key? key, required this.productType}) : super(key: key);
  final String productType;

  @override
  Widget build(BuildContext context) {
    return Text("Type: $productType",
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: AppColors.white, fontSize: 13.sp));
  }
}
