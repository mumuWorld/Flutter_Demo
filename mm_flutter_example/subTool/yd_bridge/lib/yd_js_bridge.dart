import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';

class CallFromNative {
  final String method;
  final Map<String, dynamic> args;
  final Map<String, dynamic> err;
  final int handlerId;
  final String name; //函数或事件名

  CallFromNative(this.method, this.args, this.err, this.handlerId, this.name);

  CallFromNative.fromJson(Map<String, dynamic> json)
      : method = json['method'],
        args = json['args'],
        err = json['err'],
        handlerId = json['handlerId'],
        name = json['name'];
}

class CallToNative {
  String module = '';
  String func = '';
  Map<String, dynamic> args;
  int handlerId = 0;

  CallToNative();

  Map<String, dynamic> toJson() =>
      {
        'module': module,
        'func': func,
        'args': args,
        'handlerId': handlerId,
      };
}


typedef YDEventHandler<T> = void Function(T m);
class YDNotificationCenter {

  static final _globalSubject = BehaviorSubject<CallFromNative>();
  static final _subjectMap = Map<String, PublishSubject<Map<String, dynamic>>>();

  static void notifyGlobalMsg(CallFromNative msg) {
    _globalSubject.add(msg);
  }

  static void notifyEvent(String name, Map<String, dynamic> args) {
    _subjectMap[name]?.add(args);
  }

  /// 当不是标准消息时全部可以在这里监听到
  static StreamSubscription<CallFromNative> listenGlobalMsg(YDEventHandler<CallFromNative> handler) {
    return _globalSubject.listen(handler);
  }

  static StreamSubscription<Map<String, dynamic>> listenEvent(String name, YDEventHandler<Map<String, dynamic>> handler) {
    var subject = _subjectMap[name];
    if(subject == null) {
      subject = PublishSubject<Map<String, dynamic>>();
      _subjectMap[name] = subject;
    }
    return subject.listen(handler);
  }

  static void dispose() {
    _globalSubject.close();
    _subjectMap.forEach((key, value) {
      value.close();
    });
  }
}

class JSBridgeCore {
  static const platform = const BasicMessageChannel('com.youdao/jsbridge_core_msg',BinaryCodec());
  static setup() {
    debugPrint("JSBridgeCore setup");
    platform.setMessageHandler((_msg) async {
      debugPrint("JSBridgeCore ok");
      String msg = getStringFromBytes(_msg);
      debugPrint("im recever" + msg);
      Map<String, dynamic> jsonMap = json.decode(msg);
      CallFromNative nativeCall = CallFromNative.fromJson(jsonMap);
      if(nativeCall.method == "callback") {
        debugPrint("im recever of callback");
        var completer = callbackMap.remove(nativeCall.handlerId);
        if(completer != null) {
          completer.complete(nativeCall);
        }
      } else if (nativeCall.method == "event") {
        if(nativeCall.err != null) {
          YDNotificationCenter.notifyEvent(nativeCall.name, nativeCall.err);
        } else {
          YDNotificationCenter.notifyEvent(nativeCall.name, nativeCall.args);
        }
      } else if (nativeCall.method == "func") {

      }  else {
        YDNotificationCenter.notifyGlobalMsg(nativeCall);
      }
//      return ;
    });
  }

  static String getStringFromBytes(ByteData data) {
    final buffer = data.buffer;
    var list = buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    return utf8.decode(list);
  }

  static sendMsg(CallToNative call) {
    String msg = json.encode(call);
    debugPrint("JSBridgeCore send msg");
    if (platform == null) {
      debugPrint("platform destory");
    } else {
      debugPrint("platform still live");
    }

    final WriteBuffer buffer = WriteBuffer();

    List<int> bytes = utf8.encode(msg);
    bytes.forEach((char){
      buffer.putUint8(char);
    });
    final ByteData message = buffer.done();
    platform.send(message);
  }

  static int _counter = 0;
  static int getHandlerID() {
    return _counter++;
  }
//  static Map<int, Completer<CallFromNative>> _callbackMap = {};
  static Map<int, Completer<CallFromNative>> callbackMap = {};
//  static Map<String, BaseReverseBridge> notificationMap = {};


}