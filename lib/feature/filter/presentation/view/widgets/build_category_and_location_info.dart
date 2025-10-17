import 'package:flutter/material.dart';
import 'package:flutter_task/core/color/app_colors.dart';

import 'build_category_section.dart';
import 'build_location_section.dart';

class BuildCategoryAndLocationInfo extends StatelessWidget {
  const BuildCategoryAndLocationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildCategorySection(),
        Divider(
          height: 40,
          color: AppColors.kTextBlack.withValues(alpha: 0.1),
          thickness: 1,
        ),
        BuildLocationSection(),
        SizedBox(height: 10),
        Divider(
          height: 20,
          color: AppColors.kTextBlack.withValues(alpha: 0.1),
          thickness: 1,
        ),
      ],
    );
  }
}
