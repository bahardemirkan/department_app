import 'package:flutter/material.dart';

class ImageViewerPage extends StatelessWidget {
  final String imageUrl;
  final String tag;
  const ImageViewerPage({super.key, required this.imageUrl, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(tag),
      ),
      body: Center(
        child: Hero(
          tag: tag,
          child: InteractiveViewer(
            minScale: 0.5,
            maxScale: 5,
            child: Image.network(imageUrl, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
