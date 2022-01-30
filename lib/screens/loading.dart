import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:urllauncher/screens/homepage.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatehome();
  }

  _navigatehome() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10)),
                    color: Colors.purple),
                child: const Image(
                  image: AssetImage('assets/images/premier.png'),
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Premier College ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              const Divider(
                height: 20,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Routine - Zoom Link",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SpinKitCircle(
                color: Colors.white,
                size: 100,
              )
            ],
          ),
        ));
  }
}
