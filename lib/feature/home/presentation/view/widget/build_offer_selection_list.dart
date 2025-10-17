import 'package:flutter/material.dart';
import '../../../data/models/category_model.dart';
import 'build_selection_list_item.dart';

class BuildOfferSelectionList extends StatelessWidget {
  const BuildOfferSelectionList({super.key, required this.selections});
  final List<CategoryModel> selections;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: selections.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final product = selections[index];
          return BuildSelectionListItem(product: product);
        },
      ),
    );
  }
}
