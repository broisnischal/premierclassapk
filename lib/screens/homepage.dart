// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urllauncher/pages/home.dart';
import 'package:urllauncher/pages/idpw.dart';
import 'package:urllauncher/pages/premier.dart';
import 'package:urllauncher/pages/about.dart';
import 'package:urllauncher/pages/routineimg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _mypages = [
    HomePage(),
    Routine(),
    Idpw(),
    Premier(),
    AboutMe(),
  ];
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: _mypages[_selected])),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.photo), label: "Routine"),
          const BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.plus), label: "IdPw"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.link), label: "Premier"),
          const BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
        currentIndex: _selected,
        onTap: (setValue) {
          setState(() {
            _selected = setValue;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
      ),
    );
  }
}
