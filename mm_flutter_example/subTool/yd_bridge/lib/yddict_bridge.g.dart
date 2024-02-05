// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yddict_bridge.dart';

// **************************************************************************
// JSBridgeImplGenerator
// **************************************************************************

// **************************************************************************
// 这里面的代码，不要手动改，改完运行，flutter packages pub run build_runner build命令还会回来
// **************************************************************************

class YDDictBridge {
  static Future<Map<String, dynamic>> playTTS({
    String text,
    String url,
    String lang,
    HumanVoiceType type,
    double rate,
    String tag,
    String starName,
  }) async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "playTTS";
    call.args = {
      "text": text,
      "url": url,
      "lang": lang,
      "type": type?.index,
      "rate": rate,
      "tag": tag,
      "starName": starName,
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

  static Future<void> stopTTS() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "stopTTS";
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

  static Future<Map<String, dynamic>> openParaphraseDetail(
    String word,
    String langFrom,
    String langTo,
    String itemId,
  ) async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "openParaphraseDetail";
    call.args = {
      "word": word,
      "langFrom": langFrom,
      "langTo": langTo,
      "itemId": itemId,
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

  static Future<void> openSystemSetting() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "openSystemSetting";
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

  static Future<void> keepScreenOn() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "keepScreenOn";
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

  static Future<void> keepScreenOff() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "keepScreenOff";
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

  static Future<Map<String, dynamic>> getVolume() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "getVolume";
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

  static Future<void> playVoice(
    String path,
    String name,
  ) async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "playVoice";
    call.args = {
      "path": path,
      "name": name,
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

  static Future<void> pauseVoice() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "pauseVoice";
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

  static Future<void> stopVoice() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "stopVoice";
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

  static Future<Map<String, dynamic>> isNetworkConnection() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "isNetworkConnection";
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

  static Future<void> log(
    String type,
    String name, {
    Map<String, dynamic> params,
  }) async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "log";
    call.args = {
      "type": type,
      "name": name,
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

  static Future<Map<String, dynamic>> deviceName() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "deviceName";
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

  static Future<Map<String, dynamic>> getSentence() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "getSentence";
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

  static Future<Map<String, dynamic>> getUserId() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "getUserId";
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

  static Future<Map<String, dynamic>> getYdUserId() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "getYdUserId";
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

  static Future<Map<String, dynamic>> product() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "product";
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

  static Future<Map<String, dynamic>> getFlutterBoostPageCount() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "getFlutterBoostPageCount";
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

  static Future<Map<String, dynamic>> isDebugMode() async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "isDebugMode";
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

  static Future<Map<String, dynamic>> openReadAfterPage(
    String readText,
    String readTextTrans,
    String readTextLangCode,
    String readTextTransCode,
    String voiceUrl,
  ) async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "openReadAfterPage";
    call.args = {
      "readText": readText,
      "readTextTrans": readTextTrans,
      "readTextLangCode": readTextLangCode,
      "readTextTransCode": readTextTransCode,
      "voiceUrl": voiceUrl,
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

  static Future<void> openWordVideo(
    String word,
    String json,
  ) async {
    CallToNative call = CallToNative();
    call.module = "yddict";
    call.func = "openWordVideo";
    call.args = {
      "word": word,
      "json": json,
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
