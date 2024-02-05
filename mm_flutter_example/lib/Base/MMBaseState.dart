import 'package:flutter/material.dart';


class MMBaseState<T extends StatefulWidget > extends State<T> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      color: Colors.pinkAccent.withOpacity(0.7),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.withOpacity(0.4),
          title: Text(barTitle),
        ),
        body: SafeArea(
          top: true,
            child: getBody(context)),
        floatingActionButton: floatingActionButton,
      ),
    );
  }

  Widget? get floatingActionButton {
    return null;
  }

  String get barTitle {
    return "无标题";
  }

  Widget getBody(BuildContext context) {
    return Container();
  }
}