import 'package:flutter/material.dart';
import 'package:mm_flutter_example/Base/MMBaseState.dart';

class MMLayoutWidgetExample extends StatefulWidget {
  const MMLayoutWidgetExample({Key? key}) : super(key: key);

  @override
  State<MMLayoutWidgetExample> createState() => _MMLayoutWidgetExampleState();
}

class _MMLayoutWidgetExampleState extends MMBaseState<MMLayoutWidgetExample> {

  var containerKey = GlobalKey();

  @override
  String get barTitle {
    return "布局测试";
  }

  void test() {
    containerKey.currentContext?.findRenderObject()?.performResize();
  }

  @override
  Widget getBody(BuildContext context) {
    return Column(children: [
      const Placeholder(),
      Container(
          height: 50,
          child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                  child: Text(
                    "设置Aspect Ratio",
                    style: TextStyle(fontSize: 10),
                  ),
                  color: Colors.red))),
      Container(
        key: containerKey,
          child: IntrinsicHeight(
            child:
                Column(children: [FlutterLogo(), FlutterLogo(), FlutterLogo()]),
          )),
      PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: FlutterLogo(),
      )
    ]);
  }
}
