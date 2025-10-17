import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';

class PriceAndFavoriteRow extends StatelessWidget {
  const PriceAndFavoriteRow({
    super.key,
    required this.price,
    required this.oldPrice,
  });
  final String price;
  final String oldPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                '$price جم/',
                style: AppStyles.textStyle14Medium.copyWith(
                  color: const Color(0xffFF4144),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                ',$oldPrice',
                style: AppStyles.textStyle14Medium.copyWith(
                  inherit: false,
                  color: Colors.black.withValues(alpha: 0.5),
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.favorite_border,
          color: AppColors.kTextPrimary,
          size: 24,
        ),
      ],
    );
  }
}
