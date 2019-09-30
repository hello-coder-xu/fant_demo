import 'package:fant_demo/comm/ui_util.dart';
import 'package:fant_ui/button/index.dart';
import 'package:flutter/material.dart';

///按钮页面
class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleView('按钮类型'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                FtButton(
                  child: '主要按钮',
                  type: Type.primary,
                ),
                FtButton(
                  child: '信息按钮',
                  type: Type.info,
                ),
                FtButton(
                  child: '危险按钮',
                  type: Type.warning,
                ),
                FtButton(
                  child: '警告按钮',
                  type: Type.danger,
                ),
              ],
            ),
            titleView('空心按钮'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                FtButton(
                  child: '空心主要',
                  type: Type.primary,
                  hollow: true,
                ),
                FtButton(
                  child: '空心信息',
                  type: Type.info,
                  hollow: true,
                ),
                FtButton(
                  child: '空心危险',
                  type: Type.warning,
                  hollow: true,
                ),
                FtButton(
                  child: '空心警告',
                  type: Type.danger,
                  hollow: true,
                ),
              ],
            ),
            titleView('禁用状态'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                FtButton(
                  child: '禁用主要',
                  type: Type.primary,
                  disable: true,
                ),
                FtButton(
                  child: '禁用信息',
                  type: Type.info,
                  disable: true,
                ),
                FtButton(
                  child: '禁用危险',
                  type: Type.warning,
                  hollow: true,
                  disable: true,
                ),
                FtButton(
                  child: '禁用警告',
                  type: Type.danger,
                  hollow: true,
                  disable: true,
                ),
              ],
            ),
            titleView('按钮形状'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                FtButton(
                  child: '方形按钮',
                  type: Type.primary,
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                FtButton(
                    child: '左圆按钮',
                    type: Type.primary,
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(16))),
                FtButton(
                    child: '右圆按钮',
                    type: Type.primary,
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(16))),
                FtButton(
                    child: '上圆按钮', type: Type.primary, borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                FtButton(
                    child: '下圆按钮',
                    type: Type.primary,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
                FtButton(
                  child: '圆形按钮',
                  type: Type.info,
                  roundRadius: true,
                ),
              ],
            ),
            titleView('图标按钮'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                FtButton(
                  icon: Icon(Icons.star_border, color: Colors.white),
                ),
                FtButton(
                  icon: Icon(Icons.star_border, color: Colors.white),
                  child: '按钮',
                ),
                FtButton(
                  icon: Icon(Icons.star_border, color: Colors.green),
                  child: '按钮',
                  hollow: true,
                ),
              ],
            ),
            titleView('按钮尺寸'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: <Widget>[
                FtButton(
                  child: '大号按钮',
                  size: Size.large,
                ),
                FtButton(
                  child: '普通按钮',
                  size: Size.normal,
                ),
                FtButton(
                  child: '小号按钮',
                  size: Size.small,
                ),
                FtButton(
                  child: '迷你按钮',
                  size: Size.mini,
                ),
              ],
            ),
            titleView('自定义样式'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                FtButton(
                  child: '单色颜色',
                  color: Colors.deepPurpleAccent,
                  onClick: (){},
                ),
                FtButton(
                  child: '单色按钮',
                  color: Colors.deepPurpleAccent,
                  hollow: true,
                  onClick: (){},
                ),
                FtButton(
                  child: '5°圆角',
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                FtButton(
                  child: '10°圆角',
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
