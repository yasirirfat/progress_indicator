import 'package:flutter/material.dart';
import 'package:progress_indicator/loading_indicator.dart';

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
          painter: LoadingIndicator(
            endAngle: isCompleted ? 99.9 : endAngle,
          ),
          child: const SizedBox(height: 200, width: 200),
        ),
        Positioned(
          left: width * 0.17,
          top: height * 0.08,
          child: Text(
            "$text%",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold,
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