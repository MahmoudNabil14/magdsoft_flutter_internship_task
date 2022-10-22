import 'package:flutter/material.dart';

import '../../widget/otp_widgets/otp_field.dart';

class OTPFields extends StatelessWidget {
  const OTPFields(
      {Key? key,
      required this.fieldOne,
      required this.fieldTwo,
      required this.fieldThree,
      required this.fieldFour,
      required this.fieldOneNode,
      required this.fieldTwoNode,
      required this.fieldThreeNode,
      required this.fieldFourNode})
      : super(key: key);
  final TextEditingController fieldOne;

  final TextEditingController fieldTwo;

  final TextEditingController fieldThree;

  final TextEditingController fieldFour;

  final FocusNode fieldOneNode;

  final FocusNode fieldTwoNode;

  final FocusNode fieldThreeNode;

  final FocusNode fieldFourNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OTPField(
          controller: fieldOne,
          focusNode: fieldOneNode,
          nextFocusNode: fieldTwoNode,
          previousFocusNode: null,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 14,
        ),
        OTPField(
          controller: fieldTwo,
          focusNode: fieldTwoNode,
          nextFocusNode: fieldThreeNode,
          previousFocusNode: fieldOneNode,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 14,
        ),
        OTPField(
          controller: fieldThree,
          focusNode: fieldThreeNode,
          nextFocusNode: fieldFourNode,
          previousFocusNode: fieldTwoNode,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 14,
        ),
        OTPField(
          controller: fieldFour,
          focusNode: fieldFourNode,
          nextFocusNode: null,
          previousFocusNode: fieldThreeNode,
        ),
      ],
    );
  }
}
