import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/color/app_colors.dart';
import '../../../../../core/style/app_styles.dart';
import '../../../data/models/product_model.dart';
import '../../manger/home_cubit/home_cubit.dart';

class PriceAndFavoriteRow extends StatelessWidget {
  const PriceAndFavoriteRow({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final price = NumberFormat('#,###').format(product.price);
    final oldPrice = NumberFormat('#,###').format(product.oldPrice);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                '$price جم/',
                style: AppStyles.textStyle14Medium.copyWith(
                  color: const Color(0xffFF4144),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                ',$oldPrice',
                style: AppStyles.textStyle14Medium.copyWith(
                  inherit: false,
                  color: Colors.black.withValues(alpha: 0.5),
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () async {
            if (product.id == null) return;
            await context.read<HomeCubit>().toggleFavorite(product);
          },
          child: Icon(
            product.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: product.isFavorite ? Colors.red : AppColors.kTextPrimary,
            size: 24,
          ),
        ),
      ],
    );
  }
}
