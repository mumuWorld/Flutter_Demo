import 'package:flutter/material.dart';

class ListExample extends StatefulWidget {
  const ListExample({Key? key}) : super(key: key);

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {

  ScrollController? _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container();
          },
          controller: _controller,
          padding: EdgeInsets.all(40.0),
          scrollDirection: Axis.vertical,
          itemCount: 100,
          itemExtent: 60, //强制主轴上的布局高度为60
        ),
      ),
    );
  }
}
