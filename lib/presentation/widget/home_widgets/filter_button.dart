import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[600]!.withOpacity(0.9),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(
          Icons.filter_alt_rounded,
          color: Colors.grey,
          size: 28,
        ),
      ),
    );
  }
}
