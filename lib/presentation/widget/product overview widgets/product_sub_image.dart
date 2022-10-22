import 'package:flutter/material.dart';

class ProductSubImage extends StatelessWidget {
  const ProductSubImage({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(blurRadius: 7, color: Colors.grey[600]!),
          ]),
      width: MediaQuery.of(context).size.width / 3.5,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 85,
            vertical: MediaQuery.of(context).size.height / 85),
        child: Image.asset(imagePath),
      ),
    );
  }
}
