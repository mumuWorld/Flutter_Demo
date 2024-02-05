
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mm_flutter_example/Animation/AnimationDemo.dart';
import 'package:mm_flutter_example/FBExample.dart';
import 'package:mm_flutter_example/FutureTest.dart';
import 'package:mm_flutter_example/ListExample.dart';
import 'package:mm_flutter_example/ListGame.dart';
import 'package:mm_flutter_example/NestScrollExample.dart';
import 'package:mm_flutter_example/SliverExample.dart';
import 'package:mm_flutter_example/State/mm_provider_example.dart';
import 'package:mm_flutter_example/State/mm_state_example.dart';
import 'package:mm_flutter_example/StreamExample.dart';
import 'package:mm_flutter_example/mm_custom_scroll_page.dart';
import 'package:mm_flutter_example/simple/bar_test.dart';
import 'package:mm_flutter_example/simple/mm_layout_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;

  List<Widget> _list = [];

  @override
  void initState() {
    //让所有动画变慢， 1.0正常， 越大越慢
    // timeDilation = 1.0;
    super.initState();
    _list = [
      createRouter('FutureBuilder Example', () => const FBExample()),
      createRouter('Stream', () => const StreamExample()),
      createRouter('Sliver Example', () => const SliverExample()),
      createRouter('嵌套滚动 example', () => const NestedScrollExample()),
      createRouter('动画 example', () => const AnimationDemo()),
      createRouter('布局示例 example', () => const MMLayoutWidgetExample()),
      createRouter('bar example', () => const MMBarTestExample()),
      createRouter('打开提示页', () => const ListGame()),
      createRouter('打开提示页', () => const ListExample()),
      createRouter('state example', () => const MMStateExample()),
      createRouter('provider example', () => const MMProviderExample()),
      createRouter('MMCustomScrollPage',() => const MMCustomScrollPage()),
    ];
  }

  void _incrementCounter() {
    // final state = (globalKey.currentState as _MyHomePageState);
    // state._counter;
    // final curWidget = globalKey.currentWidget as MyHomePage;
    // final curElement = globalKey.currentContext;
    // final renderBox = globalKey.currentContext?.findRenderObject() as RenderBox;
    // print(renderBox.size);

    FutureTest().test1();
    print("test1");
    setState(() {
      _counter++;
    });
  }

  var globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
        return _list[index];
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget createRouter(String text, Widget create()) {
    return ElevatedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return create();
      }));
    },
      child: Text(text),
    );
  }
}
