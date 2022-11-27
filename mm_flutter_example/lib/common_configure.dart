import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonConfigure extends InheritedWidget {
  CommonConfigure({
    required this.appName,
    required this.apiBaseUrl,
    required Widget child,
  }) : super(child: child);

  final String appName; //主页标题
  final String apiBaseUrl; //接口域名

  //方便其子Widget在Widget树中找到它
  static CommonConfigure? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(CommonConfigure oldWidget) {
    if (oldWidget.appName != appName) {
      return true;
    }
    return false;
  }
}
