import 'package:flutter/material.dart';

///
class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  List<bool> isSelected = [true, false];
  List<String> toggleValue = ['简体', '繁體'];

  Widget renderTitleBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              FlutterLogo(size: 42),
              SizedBox(width: 10),
              Text('Fant', style: TextStyle(fontSize: 48)),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: ToggleButtons(
                    isSelected: isSelected,
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    children: toggleValue.map((it) {
                      return Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        alignment: Alignment.center,
                        child: Text(it),
                      );
                    }).toList(),
                    onPressed: (int index) {
                      List.generate(
                          isSelected.length,
                          (position) =>
                              isSelected[position] = index == position);
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
          Text(
            '简单、快捷、好用的Flutter组件库',
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            renderTitleBar(),
          ],
        ),
      ),
    );
  }
}
