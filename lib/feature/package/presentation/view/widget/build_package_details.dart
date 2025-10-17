import 'package:flutter/material.dart';

import '../../../data/model/package_model.dart';
import 'build_package_features_list.dart';
import 'build_views_badge.dart';

class BuildPackageDetails extends StatelessWidget {
  const BuildPackageDetails({super.key, required this.package});

  final PackageModel package;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildPackageFeaturesList(features: package.features),
        if (package.isSelectednumberOfViews)
          BuildViewsBadge(numberOfViews: package.numberOfViews),
      ],
    );
  }
}
