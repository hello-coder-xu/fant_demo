import 'package:flutter/material.dart';

import '../config/index.dart';

class FantUI extends InheritedWidget {
  Config config;

  FantUI({this.config, child}) : super(child: child);

  static FantUI of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(FantUI);
  }

  ///获取配置
  static Config getConfig(BuildContext context) {
    FantUI fantUI = of(context);
    if (fantUI.config == null) {
      fantUI.config = Config();
    }
    return fantUI.config;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
