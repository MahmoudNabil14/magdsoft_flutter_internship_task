import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductStoreName extends StatelessWidget {
  const ProductStoreName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Acer Official Store',
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
