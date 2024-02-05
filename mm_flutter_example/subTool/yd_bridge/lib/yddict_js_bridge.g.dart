// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yddict_js_bridge.dart';

// **************************************************************************
// JSBridgeImplGenerator
// **************************************************************************

// **************************************************************************
// 这里面的代码，不要手动改，改完运行，flutter packages pub run build_runner build命令还会回来
// **************************************************************************

class YDDictJSBridge {
  static Future<Map<String, dynamic>> popupWithWord(
    String word,
    Map<String, dynamic> pos,
  ) async {
    CallToNative call = CallToNative();
    call.module = "yddictjs";
    call.func = "popupWithWord";
    call.args = {
      "word": word,
      "pos": pos,
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
