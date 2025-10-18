import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/assets.dart';

import '../../color/app_colors.dart';
import '../../style/app_styles.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key,
    this.onTap,
    required this.title,
    this.isShow = false,
  });
  final void Function()? onTap;
  final String title;
  final bool isShow;
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppStyles.textStyle16Bold.copyWith(
                      color: AppColors.kTextWhite,
                    ),
                  ),
                  if (isShow)
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Image.asset(
                        Assets.imagesPackageImageArrowBackButton,
                        height: 24,
                        width: 24,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
