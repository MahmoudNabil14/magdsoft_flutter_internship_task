import 'package:flutter/material.dart';

import '../../widget/login widgets/social_media_icon.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SocialMediaIcon(
          iconPath: 'assets/images/facebook.png',
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 16,
        ),
        const SocialMediaIcon(
          iconPath: 'assets/images/apple.png',
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 16,
        ),
        const SocialMediaIcon(
          iconPath: 'assets/images/google.png',
        )
      ],
    );
  }
}
