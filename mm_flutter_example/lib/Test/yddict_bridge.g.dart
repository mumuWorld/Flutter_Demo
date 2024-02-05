// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yddict_bridge.dart';

// **************************************************************************
// JSBridgeImplGenerator
// **************************************************************************

// **************************************************************************
// 这里面的代码，不要手动改，改完运行，flutter packages pub run build_runner build命令还会回来
// **************************************************************************

class YDDictBridge {
  static Future<void> openAITeacher(
    String word,
    String lang, {
    Map<String, dynamic> params,
  }) async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "openAITeacher";
    call.args = {
      "word": word,
      "lang": lang,
      "params": params,
    };
    call.handlerId = JSBridgeCore.getHandlerID();
    JSBridgeCore.callbackMap[call.handlerId] = Completer<CallFromNative>();
    JSBridgeCore.sendMsg(call);
    CallFromNative nativeCall =
        await JSBridgeCore.callbackMap[call.handlerId].future;
    if (nativeCall.err == null || nativeCall.err.length == 0) {
      return nativeCall.args;
    } else {
      throw nativeCall.err;
    }
  }
}
