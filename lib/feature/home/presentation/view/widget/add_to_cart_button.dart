import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart' show AppColors;
import '../../../../../core/utils/assets.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black.withValues(alpha: 0.1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Image.asset(Assets.imagesShoppingCart, width: 16, height: 16),
    );
  }
}
