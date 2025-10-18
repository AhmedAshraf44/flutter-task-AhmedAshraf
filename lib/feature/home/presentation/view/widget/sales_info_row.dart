import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';
import '../../../../../core/utils/assets.dart';

class SalesInfoRow extends StatelessWidget {
  const SalesInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          Assets.imagesHomeImageLocalFireDepartment,
          width: 13,
          height: 13,
        ),
        const SizedBox(width: 4),
        Text(
          'تم بيع 3.3k+',
          style: AppStyles.textStyle12Regular.copyWith(
            color: AppColors.kTextPrimary.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
