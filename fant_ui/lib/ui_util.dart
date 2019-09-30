// 字符串转Widget
import 'package:flutter/material.dart';

Widget toTextWidget(content, key) {
  if (content == null) return SizedBox();
  // 判断是字符串或者是widget
  if (content is Widget == false && content is String == false) {
    throw new FormatException('$key类型只能为String || Widget');
  }

  if (content is String) {
    return Text(content);
  }

  return content;
}
