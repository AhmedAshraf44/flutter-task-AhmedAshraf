import 'package:flutter/material.dart';
import 'package:flutter_task/core/color/app_colors.dart';
import 'package:flutter_task/core/utils/widgets/build_button.dart';
import 'package:flutter_task/feature/filtering/presentation/view/widgets/build_app_bar_filtering.dart';
import 'package:flutter_task/feature/filtering/presentation/view/widgets/range_input_section.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routers/app_routes.dart';
import '../../../../../core/style/app_styles.dart';
import '../../../data/filter_option.dart';
import 'build_category_and_location_info.dart';
import 'filter_chip_widget.dart';

class FilteringViewBody extends StatefulWidget {
  const FilteringViewBody({super.key});

  @override
  State<FilteringViewBody> createState() => _FilteringViewBodyState();
}

class _FilteringViewBodyState extends State<FilteringViewBody> {
  final TextEditingController minInstallmentController =
      TextEditingController();
  final TextEditingController maxInstallmentController =
      TextEditingController();
  late FilterOption filterModel;
  late List<FilterOption> firstTwo;
  late List<FilterOption> remainingOptions;
  @override
  void initState() {
    super.initState();
    firstTwo = FilterOption.options.take(2).toList();
    remainingOptions = FilterOption.options.skip(2).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          BuildAppBarFiltering(),
          const SizedBox(height: 12),
          BuildCategoryAndLocationInfo(),
          //  _buildInstallmentSection(title: 'السعر', isHintText: true),
          RangeInputSection(
            title: 'الأقساط الشهرية',
            showHint: false,
            minController: minInstallmentController,
            maxController: maxInstallmentController,
            minHint: '',
            maxHint: '',
          ),

          ...firstTwo.map((option) => _buildFilterSection(option)),
          //  _buildInstallmentSection(title: 'السعر', isHintText: true),
          RangeInputSection(
            title: 'السعر',
            showHint: true,
            minController: minInstallmentController,
            maxController: maxInstallmentController,
            minHint: 'أقل سعر',
            maxHint: 'أقصى سعر',
          ),
          ...remainingOptions.map((option) => _buildFilterSection(option)),
          const SizedBox(height: 78),
          BuildButton(
            title: 'شاهد +10,000 نتائج',
            onTap: () => GoRouter.of(context).push(AppRouter.kProfileView),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildFilterSection(FilterOption option) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kTextWhite,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              option.title,
              style: AppStyles.textStyle16Medium.copyWith(
                color: Colors.black.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: option.values.map((label) {
                final isSelected = option.selectedValue == label;
                return FilterChipWidget(
                  label: label,
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      option.selectedValue = label;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildInstallmentSection({
  //     required String title,
  //     bool isHintText = false,
  //   }) {
  //     final TextEditingController minController = TextEditingController();
  //     final TextEditingController maxController = TextEditingController();

  //     return Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  //       child: Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               title,
  //               style: AppStyles.textStyle16Medium.copyWith(
  //                 color: Colors.black.withValues(alpha: 0.5),
  //               ),
  //             ),
  //             const SizedBox(height: 12),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: TextField(
  //                     controller: minController,
  //                     keyboardType: TextInputType.number,
  //                     textAlign: TextAlign.center,
  //                     decoration: InputDecoration(
  //                       contentPadding: const EdgeInsets.symmetric(
  //                         vertical: 10,
  //                         horizontal: 8,
  //                       ),
  //                       hintText: isHintText ? 'أقل سعر' : '',
  //                       hintStyle: isHintText
  //                           ? AppStyles.textStyle14Medium.copyWith(
  //                               color: AppColors.kTextPrimary.withValues(
  //                                 alpha: 0.5,
  //                               ),
  //                             )
  //                           : TextStyle(),
  //                       border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                         borderSide: BorderSide(
  //                           color: Colors.black.withValues(alpha: 0.1),
  //                           width: 1,
  //                         ),
  //                       ),
  //                       enabledBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                         borderSide: BorderSide(
  //                           color: Colors.black.withValues(alpha: 0.1),
  //                           width: 1,
  //                         ),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                         borderSide: const BorderSide(
  //                           color: AppColors.kTextTertiary,
  //                           width: 1,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 12),
  //                 Expanded(
  //                   child: TextField(
  //                     controller: maxController,
  //                     keyboardType: TextInputType.number,
  //                     textAlign: TextAlign.center,
  //                     decoration: InputDecoration(
  //                       contentPadding: const EdgeInsets.symmetric(
  //                         vertical: 10,
  //                         horizontal: 8,
  //                       ),
  //                       hintText: isHintText ? 'أقصى سعر' : '',
  //                       hintStyle: isHintText
  //                           ? AppStyles.textStyle14Medium.copyWith(
  //                               color: AppColors.kTextPrimary.withValues(
  //                                 alpha: 0.5,
  //                               ),
  //                             )
  //                           : TextStyle(),
  //                       border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                         borderSide: BorderSide(
  //                           color: Colors.black.withValues(alpha: 0.1),
  //                           width: 1,
  //                         ),
  //                       ),
  //                       enabledBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                         borderSide: BorderSide(
  //                           color: Colors.black.withValues(alpha: 0.1),
  //                           width: 1,
  //                         ),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                         borderSide: const BorderSide(
  //                           color: AppColors.kTextTertiary,
  //                           width: 1,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
}

// lib/models/filter_model.dart
