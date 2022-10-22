import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({Key? key, required this.iconPath}) : super(key: key);
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 10,
            spreadRadius: 2,
            color: Colors.grey.withOpacity(0.8)),
      ], shape: BoxShape.circle),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.white,
        child: Image.asset(
          iconPath,
          height: MediaQuery.of(context).size.height / 20.5,
          width: MediaQuery.of(context).size.width / 10.5,
        ),
      ),
    );
  }
}
