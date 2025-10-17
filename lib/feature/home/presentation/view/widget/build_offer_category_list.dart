import 'package:flutter/material.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';
import '../../../data/models/category_model.dart';

class BuildOfferCategoryList extends StatefulWidget {
  const BuildOfferCategoryList({super.key});

  @override
  State<BuildOfferCategoryList> createState() => _BuildOfferCategoryListState();
}

class _BuildOfferCategoryListState extends State<BuildOfferCategoryList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: CategoryModel.categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = CategoryModel.categories[index];
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.kTextSecondary.withValues(alpha: 0.05)
                    : AppColors.kTextWhite.withValues(alpha: 0.3),
                border: Border.all(color: Colors.black.withValues(alpha: 0.1)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                category.name,
                style: AppStyles.textStyle14Medium.copyWith(
                  color: isSelected
                      ? AppColors.kTextSecondary
                      : AppColors.kTextPrimary.withValues(alpha: .5),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
