import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';

class BuildAppBarFiltering extends StatelessWidget {
  const BuildAppBarFiltering({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close_rounded,
                  color: AppColors.kTextPrimary,
                  size: 22,
                ),
              ),
              // const SizedBox(width: 12),
              Text('فلترة', style: AppStyles.textStyle24Medium),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Text(
              'رجوع للأفتراضى',
              style: AppStyles.textStyle16Bold.copyWith(
                color: AppColors.kTextTertiary,
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
