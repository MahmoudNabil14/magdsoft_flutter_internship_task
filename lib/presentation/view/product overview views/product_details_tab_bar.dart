import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';
import '../../widget/product overview widgets/circle_tab_bar_indicator.dart';

class ProductDetailsTabBar extends StatelessWidget {
  const ProductDetailsTabBar({Key? key, required this.tabController})
      : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: TabBar(
        controller: tabController,
        indicator:
            CircleTabBarIndicator(color: AppColors.primaryColor, radius: 5),
        indicatorWeight: 15.0,
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        tabs: <Widget>[
          Text(
            'Overview',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 16.sp, color: Colors.black),
          ),
          Text(
            'Specification',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 16.sp, color: Colors.black),
          ),
          Text(
            'Review',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 16.sp, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
