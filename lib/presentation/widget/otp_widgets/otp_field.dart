import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';

class OTPField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;

  const OTPField(
      {Key? key,
      required this.controller,
      required this.focusNode,
      required this.nextFocusNode,
      required this.previousFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67.h,
      width: 60.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 12, color: Colors.grey.withOpacity(0.8))
      ]),
      child: TextFormField(
        autofocus: false,
        style: TextStyle(
          fontSize: 16.sp,
        ),
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 32),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                )),
            fillColor: AppColors.white,
            filled: true,
            counterText: '',
            hintStyle:
                TextStyle(color: AppColors.primaryColor, fontSize: 20.0.sp)),
        onChanged: (value) {
          if (value.length == 1) {
            focusNode.unfocus();
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
          if (value.isEmpty) {
            focusNode.unfocus();
            FocusScope.of(context).requestFocus(previousFocusNode);
          }
        },
      ),
    );
  }
}
