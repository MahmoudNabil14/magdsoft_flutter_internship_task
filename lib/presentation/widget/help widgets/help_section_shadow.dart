import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class HelpSectionShadow extends StatelessWidget {
  const HelpSectionShadow({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 3,
              color: Colors.grey.withOpacity(0.5),
            )
          ]),
      child: child,
    );
  }
}
