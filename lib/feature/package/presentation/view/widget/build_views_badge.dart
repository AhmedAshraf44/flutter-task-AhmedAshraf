import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';

class BuildViewsBadge extends StatelessWidget {
  const BuildViewsBadge({super.key, required this.numberOfViews});
  final String numberOfViews;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 120 / 2,
              decoration: BoxDecoration(
                color: AppColors.kTextGreen.withValues(alpha: 0.05),
                border: Border(
                  top: BorderSide(color: AppColors.kTextGreen),
                  left: BorderSide(color: AppColors.kTextGreen),
                  right: BorderSide(color: AppColors.kTextGreen),
                  bottom: (BorderSide.none),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(55),
                  topRight: Radius.circular(55),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                numberOfViews,
                style: AppStyles.textStyle16Bold.copyWith(
                  color: AppColors.kTextGreen,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),

        Text(
          'ضعف عدد\nالمشاهدات',
          textAlign: TextAlign.center,
          style: AppStyles.textStyle12Regular.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: AppColors.kTextPrimary,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}
