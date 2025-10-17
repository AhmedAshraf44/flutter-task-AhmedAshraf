import 'package:flutter/material.dart';
import 'package:flutter_task/core/style/app_styles.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../data/nav_bar_model.dart';

class BuildNavBarItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final NavBarModel data;
  final VoidCallback onTap;

  const BuildNavBarItem({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.data,
    required this.onTap,
  });

  bool get isSelected => index == currentIndex;
  bool get isSpecial => index == 2;

  Color get _iconColor {
    if (isSpecial) return const Color(0xff0062E2);
    return isSelected
        ? AppColors.kTextPrimary
        : AppColors.kTextPrimary.withValues(alpha: 0.5);
  }

  double get _lineWidth => isSpecial ? 70 : 55;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5),
          Image.asset(
            data.asset,
            height: 18,
            color: _iconColor,
            colorBlendMode: BlendMode.srcIn,
          ),
          const SizedBox(height: 5),
          Text(
            data.label,
            style: AppStyles.textStyle12Medium.copyWith(color: _iconColor),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: 2,
            width: isSelected ? _lineWidth : 0,
            decoration: BoxDecoration(
              color: isSpecial
                  ? const Color(0xff0062E2)
                  : AppColors.kTextPrimary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(3),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kTextBlack.withValues(alpha: 0.2),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
