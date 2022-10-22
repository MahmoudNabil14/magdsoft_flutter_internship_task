import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/product overview widgets/forward_arrow.dart';
import '../../widget/product overview widgets/product_store_image.dart';
import '../../widget/product overview widgets/view_store_info.dart';

class StoreInfo extends StatelessWidget {
  const StoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 20.0),
      height: 75.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(blurRadius: 7, color: Colors.grey[600]!),
          ]),
      child: Row(
        children: [
          const ProductStoreImage(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 41,
          ),
          const ViewStoreInfo(),
          const Spacer(),
          const ForwardArrow(),
        ],
      ),
    );
  }
}
