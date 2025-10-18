import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';
import '../../../../../core/utils/assets.dart';

class BuildCategorySection extends StatelessWidget {
  const BuildCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'الفئة',
            style: AppStyles.textStyle16Medium.copyWith(
              color: AppColors.kTextBlack.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  Assets.imagesFilterImageRealEstate,
                  width: 25,
                  height: 25,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('عقارات', style: AppStyles.textStyle14Medium),
                  Text(
                    'فلل البيع',
                    style: AppStyles.textStyle12Regular.copyWith(
                      color: AppColors.kTextBlack.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                'تغيير',
                style: AppStyles.textStyle14Bold.copyWith(
                  color: AppColors.kTextQuaternary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
