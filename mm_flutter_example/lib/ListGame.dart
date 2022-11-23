import 'package:flutter/material.dart';


class ListGame extends StatefulWidget {
  const ListGame({Key? key}) : super(key: key);

  @override
  State<ListGame> createState() => _ListGameState();
}

class _ListGameState extends State<ListGame> {

  final boxs = [
    ColorBox(Colors.blue[300]!, key: UniqueKey(),),
    ColorBox(Colors.blue[600]!, key: UniqueKey(),),
    ColorBox(Colors.blue[900]!, key: UniqueKey(),),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 50,
      child: Center(

        child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            if (newIndex > oldIndex) { //向下移动
              newIndex -= 1;
            }
            print('move $oldIndex to $newIndex');
            final removeItem = boxs.removeAt(oldIndex);
            boxs.insert(newIndex, removeItem);
          },
          children: boxs,
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  final Color color;
  const ColorBox(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      color: color,
      width: 20,
      height: 50,
    );
  }
}

