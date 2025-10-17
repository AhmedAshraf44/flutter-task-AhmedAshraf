import 'package:flutter/material.dart';
import 'package:flutter_task/core/style/app_styles.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: Text('Add View', style: AppStyles.textStyle16Bold)),
      ],
    );
  }
}
