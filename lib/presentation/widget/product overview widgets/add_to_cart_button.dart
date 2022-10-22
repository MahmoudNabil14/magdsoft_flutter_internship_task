import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 180,
          horizontal: MediaQuery.of(context).size.width / 11),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 4, color: Colors.grey[400]!, spreadRadius: 2)
        ],
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          'Add To Cart',
          style:
              Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18.sp),
        ),
      ),
    );
  }
}
