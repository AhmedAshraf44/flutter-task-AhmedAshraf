import 'package:flutter/material.dart';
import 'package:flutter_task/feature/filtering/presentation/view/widgets/build_number_field.dart';
import '../../../../../core/style/app_styles.dart';

class RangeInputSection extends StatelessWidget {
  final String title;
  final bool showHint;
  final String minHint;
  final String maxHint;
  final TextEditingController minController;
  final TextEditingController maxController;

  const RangeInputSection({
    super.key,
    required this.title,
    required this.minController,
    required this.maxController,
    this.showHint = false,
    this.minHint = 'أقل قيمة',
    this.maxHint = 'أعلى قيمة',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.textStyle16Medium.copyWith(
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: BuildNumberField(
                  controller: minController,
                  hintText: showHint ? minHint : '',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: BuildNumberField(
                  controller: maxController,
                  hintText: showHint ? maxHint : '',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
