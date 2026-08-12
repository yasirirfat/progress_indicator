import 'dart:math';

import 'package:flutter/material.dart';

class LoadingIndicator extends CustomPainter {
  final double endAngle;

  LoadingIndicator({super.repaint, required this.endAngle});
  @override
  void paint(Canvas canvas, Size size) {
    final Size(:width, :height) = size;
    final radius = min(width, height) / 2;
    final center = Offset(width / 2, height / 2);

    final loadingPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 20;

    final indicatorBackgroundPaint = Paint()
      ..color = Color.fromARGB(255, 247, 243, 239);
    final innerCirclePaint = Paint()..color = Colors.white;

    final path = Path();
    path.arcTo(
      Rect.fromCircle(center: center, radius: radius * 0.9),
      degToRadian(75),
      degToRadian(endAngle),
      false,
    );
    canvas.drawCircle(center, radius, indicatorBackgroundPaint);
    canvas.drawPath(path, loadingPaint);
    canvas.drawCircle(center, radius * 0.8, innerCirclePaint);
  }

  double degToRadian(double deg) => deg * (2 * pi / 100);

  @override
  bool shouldRepaint(LoadingIndicator oldDelegate) {
    return oldDelegate.endAngle != endAngle;
  }

  @override
  bool shouldRebuildSemantics(LoadingIndicator oldDelegate) {
    return oldDelegate.endAngle != endAngle;
  }
}
