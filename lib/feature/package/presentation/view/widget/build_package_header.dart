import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';
import '../../../data/model/package_model.dart';
import '../../manger/package_cubit/package_cubit.dart';

class BuildPackageHeader extends StatelessWidget {
  const BuildPackageHeader({super.key, required this.package});

  final PackageModel package;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');
    final formattedPrice = formatter.format(package.price);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            final cubit = context.read<PackageCubit>();
            cubit.updatePackageSelection(package.id!, !package.isSelected);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                package.isSelected
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: package.isSelected
                    ? AppColors.kTextQuaternary
                    : AppColors.kTextPrimary,
              ),
              const SizedBox(width: 4),
              Center(
                child: Text(
                  package.name,
                  style: AppStyles.textStyle16Bold.copyWith(
                    color: package.isSelected
                        ? AppColors.kTextQuaternary
                        : AppColors.kTextPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          '$formattedPriceج.م ',
          style: TextStyle(
            inherit: false,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.kTextSecondary,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.kTextSecondary,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}
