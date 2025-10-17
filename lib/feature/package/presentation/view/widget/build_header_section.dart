import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';

class BuildHeaderSection extends StatelessWidget {
  const BuildHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.kTextPrimary,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(width: 12),

              Text(
                'أختر الباقات اللي تناسبك',
                style: AppStyles.textStyle24Medium,
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك',
            style: AppStyles.textStyle14Regular.copyWith(
              color: AppColors.kTextPrimary.withValues(alpha: 0.5),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
