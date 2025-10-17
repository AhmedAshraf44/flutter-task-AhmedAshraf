import 'package:flutter/material.dart';

import '../../../../../core/style/app_styles.dart';
import '../../../../../core/utils/assets.dart';

class ProductTitleRow extends StatelessWidget {
  const ProductTitleRow({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppStyles.textStyle14Medium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 4),
        Image.asset(Assets.imagesOffer, width: 20, height: 20),
      ],
    );
  }
}
