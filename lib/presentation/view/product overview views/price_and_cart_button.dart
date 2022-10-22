import 'package:flutter/material.dart';

import '../../widget/product overview widgets/add_to_cart_button.dart';
import '../../widget/product overview widgets/price.dart';

class PriceAndCartButton extends StatelessWidget {
  const PriceAndCartButton({Key? key, required this.productPrice})
      : super(key: key);
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Price(
          price: productPrice,
        ),
        const Spacer(),
        const AddToCartButton(),
      ],
    );
  }
}
