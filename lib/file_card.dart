import 'package:flutter/material.dart';

class FileCard extends StatelessWidget {
  final VoidCallback onDownloadPressed;

  const FileCard({
    super.key,
    required this.onDownloadPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);

    return Container(
      width: width * 0.6,
      height: height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 1),
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 1,
          ),
          BoxShadow(
            offset: const Offset(-1, 0),
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.012,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 15,
              child: Image.asset("assets/pdf1.png"),
            ),
            const Expanded(
              flex: 65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 10),
                  Expanded(
                    flex: 40,
                    child: Text(
                      "Dart_Assignment.pdf",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 50,
                    child: Text(
                      "136 kB . 10 May",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 20,
              child: IconButton(
                onPressed: onDownloadPressed,
                icon: const Icon(
                  Icons.file_download_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}