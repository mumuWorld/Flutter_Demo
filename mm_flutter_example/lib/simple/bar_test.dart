import 'package:flutter/material.dart';
import 'package:mm_flutter_example/Animation/tip_manager.dart';
import 'package:mm_flutter_example/Base/MMBaseState.dart';

class MMBarTestExample extends StatefulWidget {
  const MMBarTestExample({Key? key}) : super(key: key);

  @override
  State<MMBarTestExample> createState() => _MMBarTestExampleState();
}

class _MMBarTestExampleState extends MMBaseState<MMBarTestExample> {

  YDWBLastWordTipManager manager = YDWBLastWordTipManager();


  @override
  String get barTitle {
    return "bar测试";
  }

  void _incrementCounter() {
    double kSortHeaderHeight = 58;
    double topOffset = MediaQuery.of(context).padding.top + kToolbarHeight + 0 - 11;
    manager.showLastWord(context, topOffset, 0);
  }

  @override
  Widget? get floatingActionButton {
    // return null;
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ); // This ;
  }

}