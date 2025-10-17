import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class HomeBadge extends StatelessWidget {
  const HomeBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            right: -2,
            top: 1,
            child: Container(
              height: 15,
              width: 15,
              decoration: const BoxDecoration(
                color: Color(0xff0062E2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 14),
            ),
          ),
          CircleAvatar(
            backgroundColor: const Color(0xff0062E2).withValues(alpha: 0.1),
            radius: 18,
            child: Image.asset(Assets.imagesIconHome, width: 18, height: 18),
          ),
        ],
      ),
    );
  }
}
