// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ydmini_program_bridge.dart';

// **************************************************************************
// JSBridgeImplGenerator
// **************************************************************************

// **************************************************************************
// 这里面的代码，不要手动改，改完运行，flutter packages pub run build_runner build命令还会回来
// **************************************************************************

class YDMiniProgramBridge {
  static Future<void> close() async {
    CallToNative call = CallToNative();
    call.module = "mini";
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

  static Future<void> setMenus(
    List<Map<String, String>> menus,
  ) async {
    CallToNative call = CallToNative();
    call.module = "mini";
    call.func = "setMenus";
    call.args = {
      "menus": menus,
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

  static Future<void> showMenu() async {
    CallToNative call = CallToNative();
    call.module = "mini";
    call.func = "showMenu";
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

  static Future<void> addToDesktop() async {
    CallToNative call = CallToNative();
    call.module = "mini";
    call.func = "addToDesktop";
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

  static Future<void> openInWebView(
    String url,
  ) async {
    CallToNative call = CallToNative();
    call.module = "mini";
    call.func = "openInWebView";
    call.args = {
      "url": url,
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

  static Future<void> openFeedBack() async {
    CallToNative call = CallToNative();
    call.module = "mini";
    call.func = "openFeedBack";
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

  static Future<void> openFindWords() async {
    CallToNative call = CallToNative();
    call.module = "mini";
    call.func = "openFindWords";
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

  static Future<void> startPageLoading() async {
    CallToNative call = CallToNative();
    call.module = "mini";
    call.func = "startPageLoading";
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

  static Future<void> stopPageLoading() async {
    CallToNative call = CallToNative();
    call.module = "mini";
    call.func = "stopPageLoading";
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
}
