// GENERATED CODE - DO NOT MODIFY BY HAND

part of yd_bridge;

// **************************************************************************
// JSBridgeImplGenerator
// **************************************************************************

// **************************************************************************
// 这里面的代码，不要手动改，改完运行，flutter packages pub run build_runner build命令还会回来
// **************************************************************************

class YDAppBridge {
  static Future<Map<String, dynamic>> alert(
    String title,
    String desc,
    List<Map<String, String>> actions,
  ) async {
    CallToNative call = CallToNative();
    call.module = "app";
    call.func = "alert";
    call.args = {
      "title": title,
      "desc": desc,
      "actions": actions,
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

  static Future<Map<String, dynamic>> request(
    String path,
    Map<String, dynamic> params,
    String method,
    int timeout,
  ) async {
    CallToNative call = CallToNative();
    call.module = "app";
    call.func = "request";
    call.args = {
      "path": path,
      "params": params,
      "method": method,
      "timeout": timeout,
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

  static Future<Map<String, dynamic>> requestNeedSign(
      String path,
      Map<String, dynamic> params,
      String method,
      int timeout,
      {bool needSign = false, List<String> signKeys = null, int signVersion = 3}
      ) async {
    CallToNative call = CallToNative();
    call.module = "app";
    call.func = "request";
    call.args = {
      "path": path,
      "params": params,
      "method": method,
      "timeout": timeout,
      "needSign": needSign,
      "signKeys": signKeys,
      "signVersion": 3
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

  static Future<Map<String, dynamic>> toast(
    String text,
  ) async {
    CallToNative call = CallToNative();
    call.module = "app";
    call.func = "toast";
    call.args = {
      "text": text,
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

  static Future<Map<String, dynamic>> close() async {
    CallToNative call = CallToNative();
    call.module = "app";
    call.func = "close";
    call.args = {};
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

  static Future<Map<String, dynamic>> log(
    String actions,
    Map<String, dynamic> attributes,
  ) async {
    CallToNative call = CallToNative();
    call.module = "app";
    call.func = "log";
    call.args = {
      "actions": actions,
      "attributes": attributes,
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
