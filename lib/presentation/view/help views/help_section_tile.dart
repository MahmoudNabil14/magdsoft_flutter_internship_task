import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';

class HelpSectionTile extends StatelessWidget {
  const HelpSectionTile({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);
  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: AppColors.white,
      childrenPadding: const EdgeInsets.all(10),
      title: Text(
        question,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.primaryColor, fontSize: 16.sp),
      ),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            answer,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black, fontSize: 14.sp),
          ),
        )
      ],
    );
  }
}
