import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';

class OrTextDivider extends StatelessWidget {
  const OrTextDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            'OR',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 16.sp, color: AppColors.primaryColor),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
