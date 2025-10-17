import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';
import '../../../../../core/utils/assets.dart';

class BuildLocationSection extends StatelessWidget {
  const BuildLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Image.asset(Assets.imagesLocationOn, width: 25, height: 25),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('الموقع', style: AppStyles.textStyle14Medium),
              Text(
                'مصر',
                style: AppStyles.textStyle12Regular.copyWith(
                  color: Colors.black.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          Spacer(),
          Transform.rotate(
            angle: 3.14,
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.kTextPrimary,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
