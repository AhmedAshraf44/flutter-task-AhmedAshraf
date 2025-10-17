import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/color/app_colors.dart';
import 'package:flutter_task/core/utils/widgets/build_button.dart';
import 'package:flutter_task/feature/filtering/presentation/manger/filter_cubit/filter_cubit.dart';
import 'package:flutter_task/feature/filtering/presentation/view/widgets/build_app_bar_filtering.dart';
import 'package:flutter_task/feature/filtering/presentation/view/widgets/range_input_section.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routers/app_routes.dart';
import '../../../../../core/style/app_styles.dart';
import '../../../data/model/filter_option.dart';
import 'build_category_and_location_info.dart';
import 'filter_chip_widget.dart';

class FilteringViewBody extends StatelessWidget {
  const FilteringViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController minInstallmentController =
        TextEditingController();
    final TextEditingController maxInstallmentController =
        TextEditingController();
    final TextEditingController minPriceController = TextEditingController();
    final TextEditingController maxPriceController = TextEditingController();
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        if (state is FilterLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FilterSuccessState) {
          final options = state.filters;
          final firstTwo = options.take(2).toList();
          final remainingOptions = options.skip(2).toList();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                BuildAppBarFiltering(),
                const SizedBox(height: 12),
                BuildCategoryAndLocationInfo(),
                RangeInputSection(
                  title: 'الأقساط الشهرية',
                  showHint: false,
                  minController: minInstallmentController,
                  maxController: maxInstallmentController,
                  minHint: '',
                  maxHint: '',
                ),
                ...firstTwo.map((option) => BuildFilterSection(option: option)),
                RangeInputSection(
                  title: 'السعر',
                  showHint: true,
                  minController: minPriceController,
                  maxController: maxPriceController,
                  minHint: 'أقل سعر',
                  maxHint: 'أقصى سعر',
                ),
                ...remainingOptions.map(
                  (option) => BuildFilterSection(option: option),
                ),
                const SizedBox(height: 78),
                BuildButton(
                  title: 'شاهد +10,000 نتائج',
                  onTap: () =>
                      GoRouter.of(context).push(AppRouter.kProfileView),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        } else if (state is FilterFailureState) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('لا توجد بيانات'));
      },
    );
  }
}

class BuildFilterSection extends StatelessWidget {
  const BuildFilterSection({super.key, required this.option});
  final FilterOption option;
  @override
  Widget build(BuildContext context) {
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
                    context.read<FilterCubit>().updateFilter(
                      FilterOption(
                        id: option.id,
                        title: option.title,
                        values: option.values,
                        selectedValue: label,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
