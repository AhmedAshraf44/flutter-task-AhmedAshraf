import 'package:flutter/material.dart';

import '../../color/app_colors.dart';
import '../../style/app_styles.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({super.key, this.onTap, required this.title});
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.kTextTertiary,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Text(
                title,
                style: AppStyles.textStyle16Bold.copyWith(
                  color: AppColors.kTextWhite,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
