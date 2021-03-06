import 'package:flutter/material.dart';
import 'package:ticktockname/ticking/orientation_util.dart';
import 'package:ticktockname/ticking/size_config.dart';
import 'package:ticktockname/ticking/tickingname.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setVerticalOrientations();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> nameList = [
    'Beckham',
    'Rooney',
    'Lampard',
    'Gerrard',
    'Joe Cole',
    'Terry',
    'Ferdinand',
    'Ashley Cole',
    'Neville',
    'Walcott',
    'Defoe',
    'Green',
    'Vardy',
    'Saka',
    'Harry Kane',
    'Foden',
    'Pickford',
    'Sterling',
    'Arnold',
    'Hendersen',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: setVerticalOrientations(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                SizeConfig().init(context);
                return TickingNameWidget(
                  nameList: nameList, // name list
                  moveRectSize: Size(120, 50), // moving rect size
                  moveDuration: Duration(
                      seconds: 2), // moving duration(left->right or reverse)
                  textColor: Colors.red, // text color
                  boxColor: Colors.lightBlueAccent, // moving box color
                  textSize: 20, // font size
                  moveWidth: SizeConfig.screenWidth!, // box moving distance
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
