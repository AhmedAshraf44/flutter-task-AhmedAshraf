import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart' show AppColors;
import '../../../../../core/utils/assets.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kTextWhite,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.kTextBlack.withValues(alpha: 0.1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Image.asset(Assets.imagesShoppingCart, width: 19, height: 19),
    );
  }
}
