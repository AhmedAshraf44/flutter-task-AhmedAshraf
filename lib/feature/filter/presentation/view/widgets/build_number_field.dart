import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';

class BuildNumberField extends StatelessWidget {
  const BuildNumberField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      //  textAlign: TextAlign.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        hintText: hintText,
        hintStyle: AppStyles.textStyle14Medium.copyWith(
          color: AppColors.kTextPrimary.withValues(alpha: 0.5),
        ),
        border: border(AppColors.kTextBlack.withValues(alpha: 0.1)),
        enabledBorder: border(AppColors.kTextBlack.withValues(alpha: 0.1)),
        focusedBorder: border(AppColors.kTextTertiary),
      ),
    );
  }

  OutlineInputBorder border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color, width: 1),
  );
}
