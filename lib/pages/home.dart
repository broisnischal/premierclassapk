import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box box;
  List data = [];

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('data');
    return;
  }

  void showtoast(String msgs) =>
      Fluttertoast.showToast(msg: msgs, fontSize: 16);

  Future<bool> getAllData() async {
    await openBox();
    var url = Uri.parse("https://premierroutineapi.herokuapp.com/premier/data");

    try {
      var response = await http.get(url);
      var _jsondecode = jsonDecode(response.body);
      await putData(_jsondecode);
      // ignore: non_constant_identifier_names
    } catch (SocketException) {
      showtoast("No Internet Connection ");
    }

    var mymap = box.toMap().values.toList();

    if (mymap.isEmpty) {
      data.add("Empty");
    } else {
      data = mymap;
    }
    return Future.value(true);
  }

  Future putData(data) async {
    await box.clear();
    // insert data
    for (var d in data) {
      box.add(d);
    }
  }

  Future<void> updatedata() async {
    var url = Uri.parse("https://premierroutineapi.herokuapp.com/premier/data");

    try {
      var response = await http.get(url);
      var _jsondecode = jsonDecode(response.body);
      await putData(_jsondecode);
      setState(() {});
      // ignore: non_constant_identifier_names
    } catch (SocketException) {
      showtoast("Internet maynot be available");
    }
  }

  Future openBrowserUrl({required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: getAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (data.contains("Empty")) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Text("No data to serve !"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Please try again ! "),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Internet 404 !! ",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Premier College ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700)),
                  const Divider(
                    height: 10,
                    color: Colors.white,
                  ),
                  const Text("Join your class ",
                      style: TextStyle(color: Colors.grey, fontSize: 20)),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: updatedata,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.all(20),
                            child: ListTile(
                              // minVerticalPadding: 30,
                              contentPadding: const EdgeInsets.all(20),
                              leading: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/images/${data[index]['imgfile']}.png"),
                                  radius: 20),
                              title: Text(
                                "${data[index]['teachername']}",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              subtitle:
                                  Text("Subject: ${data[index]['subject']}"),
                              trailing: ElevatedButton.icon(
                                onPressed: () async {
                                  final url = data[index]['zoomlink'];
                                  try {
                                    openBrowserUrl(url: url);
                                  } catch (e) {
                                    setState(() {});
                                  }
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.link,
                                  size: 14,
                                ),
                                label: const Text("join"),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
