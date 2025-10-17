import 'package:flutter/material.dart';

import '../../../../core/style/app_styles.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: Text('Chat View', style: AppStyles.textStyle16Bold)),
      ],
    );
  }
}
