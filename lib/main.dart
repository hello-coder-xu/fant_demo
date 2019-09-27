import 'package:fant_demo/view/index.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fant Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IndexPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
