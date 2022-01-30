import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Premier extends StatefulWidget {
  const Premier({Key? key}) : super(key: key);

  @override
  _PremierState createState() => _PremierState();
}

class _PremierState extends State<Premier> {
  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: "https://www.premiercollege.edu.np/",
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
