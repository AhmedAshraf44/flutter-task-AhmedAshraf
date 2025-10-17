import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';
import '../../../../../core/utils/assets.dart';

class BuildAppBarHome extends StatelessWidget {
  const BuildAppBarHome({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('أستكشف العروض', style: AppStyles.textStyle16Medium),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  'الكل',
                  style: AppStyles.textStyle16Bold.copyWith(
                    color: AppColors.kTextBlack.withValues(alpha: 0.5),
                  ),
                ),
                SizedBox(width: 8),
                Image.asset(Assets.imagesArrowBack, height: 28, width: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
