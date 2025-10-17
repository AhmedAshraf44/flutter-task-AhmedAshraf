import 'package:flutter/material.dart';

import '../../../../core/style/app_styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: Text('Profile View', style: AppStyles.textStyle16Bold)),
      ],
    );
  }
}
