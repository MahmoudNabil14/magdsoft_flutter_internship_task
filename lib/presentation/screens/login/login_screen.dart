import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure/presentation/view/login%20views/login_form.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/login%20widgets/login_image.dart';

import '../../styles/colors.dart';
import '../../view/login views/social_media_icons.dart';
import '../../widget/login widgets/or_text_divider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const LoginImage(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 420.h,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0))),
            ),
          ),
          Positioned.fill(
            top: 150.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  LoginForm(
                      nameFormKey: nameFormKey,
                      phoneFormKey: phoneFormKey,
                      nameController: nameController,
                      phoneController: phoneController),
                  const Spacer(),
                  const OrTextDivider(),
                  const Spacer(),
                  const SocialMediaIcons(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
