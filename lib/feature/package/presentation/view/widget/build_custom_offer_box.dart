import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';

class BuildCustomOfferBox extends StatelessWidget {
  const BuildCustomOfferBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: AppColors.kTextBlack.withValues(alpha: .05)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('باقات مخصصة لك', style: AppStyles.textStyle14Medium),
            SizedBox(width: 4),
            Text(
              'تواصل معنا لأختيار الباقة المناسبة لك',
              style: AppStyles.textStyle12Regular,
            ),
            SizedBox(width: 4),
            Text(
              'فريق المبيعات',
              style: AppStyles.textStyle16Bold.copyWith(
                color: AppColors.kTextTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
