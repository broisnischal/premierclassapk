import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:urllauncher/screens/loading.dart';

void main() async {
  await Hive.initFlutter();

  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Premier Zoom",
        theme: ThemeData.dark(),
        home: const Loading()),
  );
}
