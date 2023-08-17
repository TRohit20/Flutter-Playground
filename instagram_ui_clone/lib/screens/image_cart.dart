import 'package:flutter/material.dart';

import '../data/image_data.dart';

class ImageCart extends StatelessWidget {
  const ImageCart({Key? key, required this.imageData}) : super(key: key);

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        //borderRadius: BorderRadius.circular(16.0),
        child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
