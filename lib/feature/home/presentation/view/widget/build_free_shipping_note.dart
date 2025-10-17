import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';

class BuildFreeShippingNote extends StatelessWidget {
  const BuildFreeShippingNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kTextSecondary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            children: [
              Icon(Icons.check, color: AppColors.kTextGreen, size: 24),
              SizedBox(width: 8),
              Text(
                'شحن مجاني',
                style: AppStyles.textStyle12Regular.copyWith(
                  color: AppColors.kTextGreen,
                ),
              ),

              Spacer(),
              Text(
                'لأي عرض تطلبه دلوقتي !',
                style: AppStyles.textStyle10Regular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
