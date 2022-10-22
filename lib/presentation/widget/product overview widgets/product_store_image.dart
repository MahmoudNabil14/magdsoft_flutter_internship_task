import 'package:flutter/material.dart';

class ProductStoreImage extends StatelessWidget {
  const ProductStoreImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(blurRadius: 4, color: Colors.grey[600]!),
          ]),
      child: Image.asset("assets/images/acerlogo.png"),
    );
  }
}
