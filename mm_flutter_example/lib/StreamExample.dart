import 'dart:async';

import 'package:flutter/material.dart';

class StreamExample extends StatefulWidget {
  const StreamExample({Key? key}) : super(key: key);

  @override
  State<StreamExample> createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {

  //每秒钟回调1次
  final stream = Stream.periodic(Duration(milliseconds: 1000), (_) => 10);
  //普通控制器 只能被一个对象监听
  final controller = StreamController();
  //广播数据流控制器 可以被多个监听
  final broadController = StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    //监听回调
    // stream.listen((event) {
    //   print("receive -> $event");
    // }).onError((error){
    // });

    //controller的监听模式
    // controller.sink.add(20);
    // controller.stream.listen((event) {
    //   print("receive -> $event");
    // });
  }

  /*利用 async* 构造 stream */
  Stream<DateTime> getTime() async* {
    while(true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
              controller.sink.add(10);
            },
              child: Text("点我增加sink"),),
            ElevatedButton(
              onPressed: (){
                controller.sink.add("str test");
              },
              child: Text("点我增加sink"),),
            ElevatedButton(
              onPressed: (){
                controller.sink.close();
              },
              child: Text("关闭sink"),),
            StreamBuilder(
              stream: controller.stream.distinct(), //distinct 会判断值一致就不会builder
              builder: (context, snapshot) {
                print("收到 value-> ${snapshot.data}");
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text("没有数据");
                    break;
                  case ConnectionState.waiting:
                    return const Text("正在等地啊");
                    break;
                  case ConnectionState.active:
                    return const Text("激活");
                    break;
                  case ConnectionState.done:
                    return const Text("完成");
                    break;
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

