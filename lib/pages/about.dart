// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/nees.png'),
          radius: 100,
          backgroundColor: Colors.grey,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Neeschal Dahal",
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () async {
                const url = "https://www.facebook.com/techneesofficial17/";

                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
              icon: const Icon(FontAwesomeIcons.facebook),
              iconSize: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () async {
                const url = "https://www.instagram.com/tech_nees_official/";

                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
              icon: const Icon(FontAwesomeIcons.instagram),
              iconSize: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () async {
                const url =
                    "https://www.youtube.com/channel/UCP013FdEq1ti7fz1y78v1eg";

                if (await canLaunch(url)) {
                  await launch(url,
                      forceWebView: true,
                      forceSafariVC: true,
                      enableJavaScript: true,
                      enableDomStorage: true);
                }
              },
              icon: const Icon(FontAwesomeIcons.youtube),
              iconSize: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () async {
                const url = "http://nees.eu5.net/";

                if (await canLaunch(url)) {
                  await launch(url,
                      forceWebView: true,
                      forceSafariVC: true,
                      enableJavaScript: true,
                      enableDomStorage: true);
                }
              },
              icon: const Icon(FontAwesomeIcons.link),
              iconSize: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () async {
                const url = "https://github.com/techneesofficial17";

                if (await canLaunch(url)) {
                  await launch(url,
                      forceWebView: false,
                      forceSafariVC: false,
                      enableJavaScript: true,
                      enableDomStorage: true);
                }
              },
              icon: const Icon(FontAwesomeIcons.github),
              iconSize: 40,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Contact email : ",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "neeswebservices@gmail.com",
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Esewa : ",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "9803104764",
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Buy me a coffee ?", style: TextStyle(fontSize: 20)),
            IconButton(
              onPressed: () async {
                const url = "https://www.buymeacoffee.com/neesofficial";

                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
              icon: const Icon(FontAwesomeIcons.coffee),
              color: Colors.blueAccent,
            ),
          ],
        )
      ],
    );
  }
}
