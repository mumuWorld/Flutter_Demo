import 'dart:async';

class FutureTest {
  void test1() {
    getValueEase().then((value) {
      print("get value = $value");
      return value + 1;
    }).then((value) {
      print("get value 2 = $value");
    });
  }

  // 推荐这种写法
  Future<int> getValueEase() async {
    return 100;
    throw "some error";
  }
  //等价于上面的写法 Future.value
  Future<int> getValue() {
    return Future.value(100);
  }

  void test2() {
    Future(() {
      print("add event queue");
    }).then((value) {
      print("then queue");
    }).catchError((error){
      print("add event $error");
    }).whenComplete(() {
      //报错或者then执行完 执行
      print("whenComplete");
    });
    //抛出异常
    Future.error("throw error");
    // 立即执行
    Future.value();
    scheduleMicrotask(() {
      print("add scheduleMicrotask");
    });
  }

}