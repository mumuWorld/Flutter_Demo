import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MMColor extends InheritedWidget {
  Color color;

  MMColor({required Widget child, required this.color}) : super(child: child);

  static MMColor? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MMColor>();
  }

  @override
  bool updateShouldNotify(covariant MMColor oldWidget) {
    print('MMColor: updateShouldNotify');
    return oldWidget.color != color;
  }
}


class MMInheritedModel extends InheritedModel<String> {

  Color color;
  String text;

  MMInheritedModel({required Widget child, required this.color, required this.text}) : super(child: child);

  static MMInheritedModel? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MMInheritedModel>();
  }

  @override
  // 此方法要返回true 才会调用  updateShouldNotifyDependent
  bool updateShouldNotify(covariant MMInheritedModel oldWidget) {
    print('mode: updateShouldNotify');
    return oldWidget.color != color;
  }

  @override
  bool updateShouldNotifyDependent(covariant MMInheritedModel oldWidget, Set dependencies) {
    print('mode: updateShouldNotifyDependent $dependencies');
    if (dependencies.contains('text')) {
      return oldWidget.text != text;
    }
    return false;
  }

}

class MMInheritedExampleWidget extends StatefulWidget {
  const MMInheritedExampleWidget({Key? key}) : super(key: key);

  @override
  State<MMInheritedExampleWidget> createState() => _MMInheritedExampleWidgetState();
}

class _MMInheritedExampleWidgetState extends State<MMInheritedExampleWidget> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('_MMInheritedExampleWidgetState build');
    return Container(
      width: 100,
      height: 100,
      color: MMColor.of(context)?.color,
      child: Container(),
    );
  }
}

class MMInheritedStringExampleWidget extends StatelessWidget {
  const MMInheritedStringExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MMInheritedStringExampleWidget build');
    String text = InheritedModel.inheritFrom<MMInheritedModel>(context, aspect: 'text')?.text ?? "测试";
    return Container(
      height: 50,
      child: Text(text),
    );
  }
}
