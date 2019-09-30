import 'package:fant_ui/config/index.dart';
import 'package:fant_ui/theme/index.dart';
import 'package:fant_ui/ui_util.dart';
import 'package:flutter/material.dart';

enum Size { large, normal, small, mini }

enum Type { primary, info, warning, danger }

///按钮
class FtButton extends StatefulWidget {
  final Size size;
  final Type type;
  final bool hollow;
  final bool disable;
  final bool load;
  final Icon icon;
  final Color color;
  Border border;
  BorderRadius borderRadius;
  bool roundRadius;
  final dynamic child;
  final Function onClick;

  FtButton({
    this.size = Size.normal,
    this.type = Type.primary,
    this.hollow = false,
    this.disable = false,
    this.load = false,
    this.icon,
    this.child,
    this.color,
    this.border,
    this.borderRadius,
    this.roundRadius = false,
    this.onClick,
  });

  @override
  FtButtonState createState() => new FtButtonState();
}

class FtButtonState extends State<FtButton> {
  Config config;
  GlobalKey key = GlobalKey();
  double radius;
  bool displayRoundRadius = false;

  void initState() {
    super.initState();

    //获取渲染后控件高度
    if (widget.roundRadius) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        radius = key.currentContext.size.height;
        displayRoundRadius = true;
        setState(() {});
      });
    }
  }

  //获取颜色
  Color getColor() {
    if (widget.color != null) return widget.color;
    if (widget.type == Type.info) {
      return config.infoColor;
    } else if (widget.type == Type.warning) {
      return config.warningColor;
    } else if (widget.type == Type.danger) {
      return config.dangerColor;
    }
    return config.primaryColor;
  }

  //获取角度
  BorderRadius getBorderRadius() {
    if (displayRoundRadius) {
      return BorderRadius.all(Radius.circular(radius / 2));
    }
    return widget.borderRadius ?? BorderRadius.all(Radius.circular(3));
  }

  //获取边框
  Border getBorder() {
    Color color = getColor();
    return widget.border ?? Border.all(color: color, width: 0.5);
  }

  //获取装饰
  BoxDecoration getBoxDecoration() {
    Color color = getColor();

    BorderRadius borderRadius = getBorderRadius();

    Border border = getBorder();

    BoxDecoration boxDecoration = BoxDecoration(
      color: widget.hollow ? Colors.white : color,
      border: border,
      borderRadius: borderRadius,
    );

    return boxDecoration;
  }

  //获取大小
  MainAxisSize getMainAxisSize() {
    if (widget.size == Size.large) {
      return MainAxisSize.max;
    } else {
      return MainAxisSize.min;
    }
  }

  //获取间距
  EdgeInsetsGeometry getPadding() {
    if (widget.size == Size.mini) {
      return EdgeInsets.all(0);
    } else if (widget.size == Size.small) {
      return EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2);
    } else if (widget.size == Size.normal) {
      return EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5);
    } else {
      return EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8);
    }
  }

  //获取字体样式
  TextStyle getTextStyle() {
    if (widget.hollow) {
      return TextStyle(fontSize: 14, color: getColor());
    } else {
      return TextStyle(fontSize: 14, color: Colors.white);
    }
  }

  //获取图标
  Widget getIcon() {
    if (widget.load) {
      return Container(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 2,
        ),
      );
    } else if (widget.icon != null) {
      return widget.icon;
    } else {
      return SizedBox();
    }
  }

  //获取文本内容
  Widget getTextView() {
    if (widget.child == null) return SizedBox();
    return DefaultTextStyle(
      style: getTextStyle(),
      child: toTextWidget(widget.child, 'button text'),
    );
  }

  @override
  Widget build(BuildContext context) {
    config = FantUI.getConfig(context);

    Widget icon = getIcon();

    Widget textView = getTextView();

    List<Widget> children = [icon, textView];

    if ((widget.load || widget.icon != null) && widget.child != null) {
      children.insert(1, SizedBox(width: 5));
    }

    Widget child = Container(
      key: key,
      decoration: getBoxDecoration(),
      padding: getPadding(),
      child: Row(
        mainAxisSize: getMainAxisSize(),
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );

    if (widget.disable) {
      return Opacity(
        opacity: 0.5,
        child: child,
      );
    }

    if (widget.onClick is Function) {
      return InkWell(
        onTap: widget.onClick,
        child: child,
      );
    }

    return child;
  }
}
