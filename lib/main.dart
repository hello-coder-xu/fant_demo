import 'package:fant_demo/router/index.dart';
import 'package:fant_demo/view/index.dart';
import 'package:flutter/material.dart';

import 'package:fant_ui/theme/index.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return FantUI(
      child: MaterialApp(
        title: 'Fant Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: IndexPage(),
        routes: routers,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
