import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsTabBarView extends StatelessWidget {
  const ProductDetailsTabBarView(
      {Key? key, required this.tabController, required this.productDescription})
      : super(key: key);
  final TabController tabController;
  final String productDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20),
      width: double.infinity,
      height: 410.h,
      child: TabBarView(
        controller: tabController,
        children: <Widget>[
          Text(
            productDescription,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey, fontSize: 16.sp),
          ),
          Text(
            productDescription,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey, fontSize: 16.sp),
          ),
          Text(
            productDescription,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
