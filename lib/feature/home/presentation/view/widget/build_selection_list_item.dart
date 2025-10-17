import 'package:flutter/material.dart';

import '../../../../../core/style/app_styles.dart';
import '../../../data/models/category_model.dart';

class BuildSelectionListItem extends StatelessWidget {
  const BuildSelectionListItem({super.key, required this.product});

  final CategoryModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 85,
          height: 78,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: AssetImage(product.image ?? ''),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(product.name, style: AppStyles.textStyle12Regular),
      ],
    );
  }
}
