import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'product_store_name.dart';

class ViewStoreInfo extends StatelessWidget {
  const ViewStoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ProductStoreName(),
        SizedBox(
          height: MediaQuery.of(context).size.height / 117,
        ),
        Text(
          'View Store',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 12.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
