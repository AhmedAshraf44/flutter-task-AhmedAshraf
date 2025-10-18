import 'package:flutter/material.dart';
import 'package:flutter_task/feature/home/presentation/view/widget/home_badge.dart';

import '../../../../../core/utils/assets.dart';
import 'add_to_cart_button.dart';

class BottomActionRow extends StatelessWidget {
  const BottomActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: const HomeBadge(),
        ),
        Row(
          children: [
            AddToCartButton(),
            const SizedBox(width: 15),
            Image.asset(
              Assets.imagesHomeImageTmgHolding,
              width: 18,
              height: 25,
            ),
          ],
        ),
      ],
    );
  }
}
