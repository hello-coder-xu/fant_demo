import 'package:flutter/material.dart';

///配置
class Config {
  /// 主色
  final Color primaryColor;

  ///信息色
  final Color infoColor;

  ///危险色
  final Color warningColor;

  ///警告色
  Color dangerColor;

  ///边框色
  Color borderColor;

  ///蒙版色
  Color maskColor;

  Config({
    this.primaryColor = Colors.green,
    this.infoColor = Colors.blue,
    this.warningColor = Colors.red,
    dangerColor,
    borderColor,
    maskColor,
  }) {
    this.dangerColor = Colors.redAccent[100];
    this.borderColor = Colors.grey[200];
    this.maskColor = Color.fromRGBO(17, 17, 17, 0.6);
  }
}
