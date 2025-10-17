import 'package:flutter/material.dart';
import 'package:flutter_task/feature/package/data/model/package_feature_model.dart';

import '../../../../../core/style/app_styles.dart';

class BuildPackageFeaturesList extends StatelessWidget {
  const BuildPackageFeaturesList({super.key, required this.features});
  final List<PackageFeatureModel> features;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          features.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 0, top: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    features[index].image ?? '',
                    height: 28,
                    width: 28,
                  ),
                ),
                SizedBox(width: 8),
                features[index].stickyDurationHours == null ||
                        features[index].stickyDurationHours == ''
                    ? Expanded(
                        child: Text(
                          '${features[index].title}',
                          style: AppStyles.textStyle14Medium,
                        ),
                      )
                    : Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${features[index].title}',
                              style: AppStyles.textStyle14Medium,
                            ),

                            Text(
                              '${features[index].stickyDurationHours}',
                              style: AppStyles.textStyle14Medium.copyWith(
                                color: const Color(0xffFF4144),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
