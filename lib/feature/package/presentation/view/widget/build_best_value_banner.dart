import 'package:flutter/material.dart';
import '../../../../../core/style/app_styles.dart';

class BuildBestValueBanner extends StatelessWidget {
  const BuildBestValueBanner({super.key, required this.bestValue});
  final String bestValue;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -21,
      right: 0,
      child: CustomPaint(
        painter: _BannerCutPainter(),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(15),
              ),
            ),
            padding: const EdgeInsets.only(left: 20, right: 4),
            alignment: Alignment.centerRight,
            child: Text(
              bestValue,
              style: AppStyles.textStyle12Medium.copyWith(
                color: const Color(0xffFF4144),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BannerCutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFFFDBDB);

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(15, size.height / 2)
      ..close();

    canvas.drawPath(path, paint);

    final rrect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, size.width, size.height),
      topRight: const Radius.circular(8),
      bottomRight: const Radius.circular(8),
    );

    canvas.clipRRect(rrect);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
