import 'package:flutter/material.dart';

class SliverExample extends StatefulWidget {
  const SliverExample({Key? key}) : super(key: key);

  @override
  State<SliverExample> createState() => _SliverExampleState();
}

class _SliverExampleState extends State<SliverExample> {
  @override
  Widget build(BuildContext context) {
    // //从父类查找类型
    // context.dependOnInheritedWidgetOfExactType();
    // //找到父类的state
    // (context as Element).findAncestorStateOfType();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Sliver App Bar'),
            expandedHeight: 100,  //拉伸后高度。
            stretch: true,  //可拉伸
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              title: Text('FlexibleSpaceBar Title'),
              collapseMode: CollapseMode.none,
              stretchModes: [ //拉伸模式
                StretchMode.blurBackground,
                StretchMode.fadeTitle
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Placeholder(),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              FlutterLogo(size: 50,),
              FlutterLogo(size: 100,),
              FlutterLogo(size: 150,)
            ]
          ))
        ],
      ),
    );
  }
}
