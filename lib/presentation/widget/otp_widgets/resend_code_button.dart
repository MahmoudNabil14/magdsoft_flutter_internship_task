import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Resend Code',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
