import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3));
      CacheHelper.getDataFromSharedPreference(key: "isLoggedIn") != null
          ? Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeScreen, (route) => false)
          : Navigator.pushNamedAndRemoveUntil(
              context, Routes.loginScreen, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0062BD),
      body: Center(
        child: Image(
            image: const Svg(
              'assets/images/splash.svg',
            ),
            height: 330.h,
            width: 240.w),
      ),
    );
  }
}
