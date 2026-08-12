import 'dart:async';
import 'package:flutter/material.dart';

import 'file_card.dart';
import 'download_progress_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Loading Indicator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double endAngle = 0.0;
  String text = '0';
  bool isCompleted = false;
  bool isVisible = false;
  Timer? _timer;

  void _startDownload() {
    if (isVisible && !isCompleted) return;

    setState(() {
      isVisible = true;
      isCompleted = false;
      endAngle = 0.0;
      text = '0';
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      setState(() {
        if (endAngle < 100.0) {
          endAngle += 1;
          text = endAngle.toInt().toString();
        } else {
          isCompleted = true;
          endAngle = 100;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
        ),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FileCard(onDownloadPressed: _startDownload),
            SizedBox(height: height * 0.1),
            isVisible
                ? DownloadProgressView(
                    endAngle: endAngle,
                    text: text,
                    isCompleted: isCompleted,
                  )
                : const SizedBox(height: 200, width: 200),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }
}
