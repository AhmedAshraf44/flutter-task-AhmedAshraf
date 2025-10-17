import 'package:flutter/material.dart';

import '../../../../core/style/app_styles.dart';

class AdvertisingView extends StatelessWidget {
  const AdvertisingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text('Advertising View', style: AppStyles.textStyle16Bold),
        ),
      ],
    );
  }
}
