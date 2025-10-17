import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';
import 'product_card.dart';

class ProductGridSliver extends StatelessWidget {
  const ProductGridSliver({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.46,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: products.length,
          (context, index) => ProductCard(item: products[index]),
        ),
      ),
    );
  }
}
