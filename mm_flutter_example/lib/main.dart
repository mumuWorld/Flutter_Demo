import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mm_flutter_example/FBExample.dart';
import 'package:mm_flutter_example/FutureTest.dart';
import 'package:mm_flutter_example/ListExample.dart';
import 'package:mm_flutter_example/ListGame.dart';
import 'package:mm_flutter_example/StreamExample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;

  @override
  void initState() {
    //让所有动画变慢
    timeDilation = 5.0;
    super.initState();
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            AnimatedContainer(
              duration: Duration(seconds: 2),
              child: Container(),
            ),
            Flex(direction: Axis.horizontal),
            ElevatedButton(
              onPressed: () async {
                // 打开`TipRoute`，并等待返回结果
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ListGame(
                          // 路由参数
                          // text: "我是提示xxxx",
                          );
                    },
                  ),
                );
                //输出`TipRoute`路由返回结果
                print("路由返回值: $result");
              },
              child: Text("打开提示页"),
            ),
            ElevatedButton(
              onPressed: () async {
                // 打开`TipRoute`，并等待返回结果
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ListExample(
                          // 路由参数
                          // text: "我是提示xxxx",
                          );
                    },
                  ),
                );
                //输出`TipRoute`路由返回结果
                print("路由返回值: $result");
              },
              child: Text("打开提示页"),
            ),
            createRouter('FutureBuilder Example', () => const FBExample()),
            createRouter('Stream', () => const StreamExample())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget createRouter(String text, Widget create()) {
    return MaterialButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return create();
      }));
    },
      child: Text(text),
    );
  }
}
