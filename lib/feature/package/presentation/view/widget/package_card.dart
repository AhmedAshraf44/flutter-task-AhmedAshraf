import 'package:flutter/material.dart';
import '../../../../../core/color/app_colors.dart';
import '../../../data/model/package_model.dart';
import 'build_best_value_banner.dart';
import 'build_package_details.dart';
import 'build_package_header.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({super.key, required this.package});
  final PackageModel package;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.kTextWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black.withValues(alpha: .1)),
            boxShadow: [
              BoxShadow(
                color: AppColors.kTextPrimary.withValues(alpha: .04),
                blurRadius: 5,
                spreadRadius: 0,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildPackageHeader(package: package),
              Divider(color: Colors.black.withValues(alpha: 0.1), height: 24),
              BuildPackageDetails(package: package),
            ],
          ),
        ),
        if (package.isBestValue)
          BuildBestValueBanner(bestValue: package.bestValue ?? ''),
      ],
    );
  }
}
