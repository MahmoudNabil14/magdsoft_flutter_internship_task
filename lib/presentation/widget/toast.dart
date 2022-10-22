import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String toastMessage, required Color backgroundColor}) {
  Fluttertoast.showToast(
      msg: toastMessage, backgroundColor: backgroundColor, fontSize: 16.0.sp);
}
