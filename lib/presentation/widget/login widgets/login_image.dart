import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/login.jpg",
      fit: BoxFit.fill,
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
    );
  }
}
