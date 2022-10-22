import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class HelpText extends StatelessWidget {
  const HelpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Help",
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: AppColors.white),
    );
  }
}
