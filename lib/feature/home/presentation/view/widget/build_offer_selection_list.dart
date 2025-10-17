import 'package:flutter/material.dart';

import '../../../../../core/style/app_styles.dart';
import '../../../data/models/category_model.dart';

class BuildOfferSelectionList extends StatelessWidget {
  const BuildOfferSelectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: CategoryModel.itemSelect.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final product = CategoryModel.itemSelect[index];
          return BuildSelectionListItem(product: product);
        },
      ),
    );
  }
}

class BuildSelectionListItem extends StatelessWidget {
  const BuildSelectionListItem({super.key, required this.product});

  final CategoryModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 65,
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
