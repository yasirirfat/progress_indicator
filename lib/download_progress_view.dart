import 'package:flutter/material.dart';
import 'package:progress_indicator/loading_indicator_painter.dart';

class DownloadProgressView extends StatelessWidget {
  final double endAngle;
  final String text;
  final bool isCompleted;

  const DownloadProgressView({
    super.key,
    required this.endAngle,
    required this.text,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        CustomPaint(
          painter: LoadingIndicator(endAngle: isCompleted ? 99.9 : endAngle),
          child: const SizedBox(height: 200, width: 200),
        ),
        Positioned(
          left: width * 0.16,
          top: height * 0.08,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 35, // Main number ka size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '%',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize:
                        20, // '%' ka chota size (apne hisab se change kar sakte hain)
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: width * 0.12,
          top: height * 0.13,
          child: const Text(
            "Downloaded",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
