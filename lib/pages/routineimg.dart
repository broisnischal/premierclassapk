import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Routine extends StatelessWidget {
  const Routine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child: PhotoView(
      imageProvider: const AssetImage('assets/images/routine.jpg'),
      minScale: PhotoViewComputedScale.contained * 0.8,
      maxScale: PhotoViewComputedScale.covered * 1.8,
      initialScale: PhotoViewComputedScale.contained * 1,
    )));
  }
}
