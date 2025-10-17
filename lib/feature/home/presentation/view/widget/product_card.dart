import 'package:flutter/material.dart';
import '../../../../../core/color/app_colors.dart';
import '../../../data/models/product_model.dart';
import 'bottom_action_row.dart';
import 'price_and_favorite_row.dart';
import 'product_title_row.dart';
import 'sales_info_row.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.item});
  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kTextWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.kTextPrimary.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Image.asset(item.imageUrl, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ProductTitleRow(title: item.name),
                const SizedBox(height: 8),
                PriceAndFavoriteRow(product: item),
                const SizedBox(height: 8),
                SalesInfoRow(),
                const SizedBox(height: 31),
                BottomActionRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
