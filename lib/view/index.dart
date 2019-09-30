import 'package:flutter/material.dart';

///
class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  List<bool> isSelected = [true, false];
  List<String> toggleValue = ['简体', '繁體'];

  final list = [
    {
      'title': '基础组件',
      'icon': Icons.apps,
      'open': false,
      'children': [
        {'title': 'Button 按钮', 'url': '/button'},
        {'title': 'Cell 单元格', 'url': ''},
        {'title': 'Icon 图标', 'url': ''},
        {'title': 'Image 图片', 'url': ''},
        {'title': 'Layout 布局', 'url': ''},
        {'title': 'Popup 弹出层', 'url': ''},
      ],
    },
    {
      'title': '表单组件',
      'icon': Icons.insert_drive_file,
      'open': false,
      'children': [
        {'title': 'Checkbox 复选框', 'url': ''},
        {'title': 'DatetimePicker 时间选择', 'url': ''},
        {'title': 'Field 输入框', 'url': ''},
        {'title': 'NumberKeyboard 数字键盘', 'url': ''},
        {'title': 'PasswordInput 密码输入框', 'url': ''},
        {'title': 'Picker 选择器', 'url': ''},
        {'title': 'Radio 单选框', 'url': ''},
        {'title': 'Rate 评分', 'url': ''},
        {'title': 'Search 搜索', 'url': ''},
        {'title': 'Slider 滑块', 'url': ''},
        {'title': 'Stepper 进步器', 'url': ''},
        {'title': 'Switch 开关', 'url': ''},
        {'title': 'SwitchCell 开关单元格', 'url': ''},
        {'title': 'Uploader 文件上传', 'url': ''},
      ],
    },
    {
      'title': '反馈组件',
      'icon': Icons.feedback,
      'open': false,
      'children': [
        {'title': 'ActionSheet 上拉菜单', 'url': ''},
        {'title': 'Dialog 对话框', 'url': ''},
        {'title': 'DropdownMenu 下来菜单', 'url': ''},
        {'title': 'Loading 加载', 'url': ''},
        {'title': 'Notify 消息通知', 'url': ''},
        {'title': 'Overlay 遮罩层', 'url': ''},
        {'title': 'PullRefresh 下拉刷新', 'url': ''},
        {'title': 'SwipeCell 滑动单元格', 'url': ''},
        {'title': 'Toast 轻提示', 'url': ''},
      ],
    },
    {
      'title': '展示组件',
      'icon': Icons.image,
      'open': false,
      'children': [
        {'title': 'Cirle 环形进度条', 'url': ''},
        {'title': 'Collapse 折叠面板', 'url': ''},
        {'title': 'CountDown 倒计时', 'url': ''},
        {'title': 'Divider 分割线', 'url': ''},
        {'title': 'ImagePreview 图片预览', 'url': ''},
        {'title': 'Lazyload 图片懒加载', 'url': ''},
        {'title': 'List 列表', 'url': ''},
        {'title': 'NoticeBar 通知栏', 'url': ''},
        {'title': 'Panel 面板', 'url': ''},
        {'title': 'Progress 进度条', 'url': ''},
        {'title': 'Skeleton 骨架屏', 'url': ''},
        {'title': 'Steps 步骤条', 'url': ''},
        {'title': 'Sticky 粘性布局', 'url': ''},
        {'title': 'Swipe 轮播', 'url': ''},
        {'title': 'Tag 标记', 'url': ''},
      ],
    },
    {
      'title': '导航组件',
      'icon': Icons.navigation,
      'open': false,
      'children': [
        {'title': 'Grid 宫格', 'url': ''},
        {'title': 'IndexBar 索引栏', 'url': ''},
        {'title': 'NavBar 导航栏', 'url': ''},
        {'title': 'Pagination 分页', 'url': ''},
        {'title': 'Sidebar 侧边导航', 'url': ''},
        {'title': 'Tab 标签页', 'url': ''},
        {'title': 'Tabbar 标签栏', 'url': ''},
        {'title': 'TreeSelect 分类选择', 'url': ''},
      ],
    },
  ];

  //标题
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
                    children: toggleValue.map((it) {
                      return Container(
                        constraints: BoxConstraints(
                          maxHeight: 30,
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.center,
                        child: Text(it),
                      );
                    }).toList(),
                    onPressed: (int index) {
                      List.generate(isSelected.length, (position) => isSelected[position] = index == position);
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

  //小视图
  Widget renderSmallItem(var bean) {
    List data = bean['children'];
    return Column(
      children: data.map((it) {
        return GestureDetector(
          onTap: () => itemContentClick(it),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[100], width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(it['title'], style: TextStyle(color: Colors.black54)),
                Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  //大视图
  Widget renderBigItem(var bean) {
    bool open = bean['open'];
    Widget titleView = GestureDetector(
      onTap: () => itemTitleClick(bean),
      child: Container(
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(bean['title']),
            Icon(bean['icon'], color: Colors.grey),
          ],
        ),
      ),
    );

    List<Widget> children = [titleView];

    children.add(AnimatedCrossFade(
      firstChild: Container(),
      secondChild: renderSmallItem(bean),
      firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
      secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
      sizeCurve: Curves.fastOutSlowIn,
      crossFadeState: open ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Duration(milliseconds: 250),
    ));

    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      SizedBox(height: 40),
      renderTitleBar(),
      SizedBox(height: 20),
    ];

    list.forEach((it) => children.add(renderBigItem(it)));

    return Scaffold(
      body: SingleChildScrollView(child: Column(children: children)),
    );
  }

  //item 标题点击
  void itemTitleClick(var bean) {
    bean['open'] = !bean['open'];
    setState(() {});
  }

  //item 内容点击
  void itemContentClick(var bean) {
    String url = bean['url'];
    if (url.length == 0) {
      print('还未实现');
    } else {
      Navigator.of(context).pushNamed(bean['url']);
    }
  }
}
