import 'package:flutter/material.dart';

class FBExample extends StatefulWidget {
  const FBExample({Key? key}) : super(key: key);
  @override
  State<FBExample> createState() => _FBExampleState();
}

class _FBExampleState extends State<FBExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder Example"),
      ),
      body: Center(
        child: FutureBuilder(
          future: getValueEase(),
          initialData: 50,  //初始值
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text("加载中。。。"),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              return Text("Future active");
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("加载错误 ${snapshot.error}");
              } else {
                return Text("加载完成 ${snapshot.data}");
              }
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Text("Future null");
            }
            return Text("change");
        },),
      ),
    );
  }

  // 推荐这种写法
  Future<int> getValueEase() async {
    return Future.delayed(Duration(milliseconds: 3000), () => 200);
    throw "some error";
  }
}
