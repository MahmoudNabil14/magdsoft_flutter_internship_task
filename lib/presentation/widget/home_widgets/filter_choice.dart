import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';

class FilterChoice extends StatelessWidget {
  const FilterChoice(
      {Key? key,
      required this.filterName,
      required this.filterImagePath,
      required this.defaultChoice,
      required this.onSelected,
      required this.index})
      : super(key: key);
  final String filterName;
  final String filterImagePath;
  final int defaultChoice;
  final int index;
  final Function onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 55),
        child: ChoiceChip(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width / 20,
              left: MediaQuery.of(context).size.width / 85),
          shadowColor: Colors.grey,
          elevation: 6,
          pressElevation: 0.0,
          selectedColor: AppColors.primaryColor,
          backgroundColor: Colors.white,
          label: Row(
            children: [
              Container(
                child: CircleAvatar(
                  minRadius: 22.h,
                  backgroundColor: AppColors.white,
                  child: Image.asset(
                    filterImagePath,
                    height: 32.h,
                    width: 32.w,
                  ),
                ),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(blurRadius: 7, color: Colors.grey)]),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 42,
              ),
              Text(
                filterName,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: defaultChoice == index ? Colors.white : Colors.black,
                    fontSize: 20.sp),
              ),
            ],
          ),
          selected: defaultChoice == index,
          onSelected: (bool selected) {
            onSelected();
          },
        ));
  }
}
