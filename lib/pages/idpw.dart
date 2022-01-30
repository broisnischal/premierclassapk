import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Idpw extends StatelessWidget {
  const Idpw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ID Password"),
          centerTitle: true,
        ),
        body: PhotoView(
          imageProvider: const AssetImage('assets/images/idpw.jpg'),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 1.8,
          initialScale: PhotoViewComputedScale.contained * 1,
        ));
  }
}


// Center(
//           child: PhotoView(
//             imageProvider: AssetImage('assets/images/idpw.jpg'),
//           ),
//         ));