import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Price extends StatelessWidget {
  const Price({Key? key, required this.price}) : super(key: key);
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 14.sp, color: Colors.grey),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 82,
        ),
        Text(
          '$price EGP',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 16.sp, color: Colors.black),
        ),
      ],
    );
  }
}
