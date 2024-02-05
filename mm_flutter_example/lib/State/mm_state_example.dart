import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mm_flutter_example/Base/MMBaseState.dart';
import 'package:mm_flutter_example/State/mm_inherited_example.dart';


class MMStateExample extends StatefulWidget {
  const MMStateExample({Key? key}) : super(key: key);

  @override
  State<MMStateExample> createState() => _MMStateExampleState();
}

class _MMStateExampleState extends MMBaseState<MMStateExample> {

  int _count = 0;

  DoubleHolder holder = DoubleHolder();

  final _countController = CountLabelContorller();
  final _countController_2 = CountLabelContorller_2();

  Color _changeColor = Colors.red;
  String _tmpStr = "init Str";

  @override
  Widget getBody(BuildContext context) {
    print('触发 build');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("count numbersdfsdfsdfsdfdsfdsfsd $_count"),
          Foo(count: _count,),
          const Text("例子2: ChangeNotifier使用"),
          CountLabel(controller: _countController, controller_2: _countController_2,),
          const Text("例子3: Inherited使用"),
          MMColor(color: _changeColor, child: const MMInheritedExampleWidget()),
          MMInheritedModel(color: _changeColor, text: _tmpStr, child: const MMInheritedStringExampleWidget())
        ],
      ),
    );
  }

  @override
  Widget? get floatingActionButton {
    return FloatingActionButton(
      onPressed: (){
        // setState(() {
          _count += 1;
          // 重置例子2
          _countController.count = 0;
          _countController_2.count.value = 0;
        // });
        // notify 不需要setState, inherit 必须setState
        setState(() {
          _changeColor = Colors.lightGreenAccent;
          _tmpStr = "change str";
        });
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class DoubleHolder extends ChangeNotifier {
  double _value = 0.5;

  DoubleHolder();

  double get valve => _value;

  set value(double newValue) {
    value = newValue;
    notifyListeners();
  }
}



class Foo extends StatelessWidget {

  int count = 0;

  Foo({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.shade100,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Center(child: FlutterLogo(size: 50,)),
          Text("foo number: $count"),

        ],
      ),
    );
  }
}
/// mark ChangeNotifier例子--------------
class CountLabelContorller extends ValueNotifier {
  double _count = 0;
  CountLabelContorller() : super(null);
  double get count => _count;
  set count(double newValue) {
    _count = newValue;
    notifyListeners();
  }
}

/*另一种用法*/
class CountLabelContorller_2 {
  ValueNotifier<int> count = ValueNotifier(0);
}

class CountLabel extends StatefulWidget {
  final CountLabelContorller controller;
  final CountLabelContorller_2 controller_2;

  const CountLabel({Key? key, required this.controller, required this.controller_2}) : super(key: key);

  @override
  State<CountLabel> createState() => _CountLabelState();
}

class _CountLabelState extends State<CountLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            widget.controller.count += 1;
          },
          child: ValueListenableBuilder(
              valueListenable: widget.controller,
              builder: (context, build, child) {
                print('例子2.1: rebuild');
                return Text("count_1: ${widget.controller.count}");
              }),
        ),
        ElevatedButton(
          onPressed: () {
            widget.controller_2.count.value += 1;
          },
          child: ValueListenableBuilder(
              valueListenable: widget.controller_2.count,
              builder: (context, build, child) {
                print('例子2.2: rebuild');
                return Text("count_2: ${widget.controller_2.count.value}");
              }),
        ),
      ],
    );
  }
}

