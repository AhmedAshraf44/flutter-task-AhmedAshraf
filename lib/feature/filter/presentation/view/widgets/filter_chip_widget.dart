import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.kTextTertiary.withValues(alpha: 0.05)
              : AppColors.kTextWhite,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected
                ? AppColors.kTextTertiary
                : Colors.black.withValues(alpha: 0.1),
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Text(
          label,
          textDirection: TextDirection.rtl,
          style: AppStyles.textStyle14Medium.copyWith(
            color: isSelected
                ? AppColors.kTextTertiary
                : AppColors.kTextPrimary.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }
}
