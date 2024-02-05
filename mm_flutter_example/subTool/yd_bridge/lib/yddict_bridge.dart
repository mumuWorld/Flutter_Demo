import 'package:flutter_jsbridge_builder/js_bridge_module.dart';
import 'package:yd_bridge/yd_js_bridge.dart';
import 'dart:async';


part 'yddict_bridge.g.dart';

enum HumanVoiceType {
  none,
  uk,
  us
}

@JSBridgeModule(moduleName: "yddict", enumTypeName: ["HumanVoiceType"])
class DictBridge {
  Map<String, dynamic> playTTS({String text,String url, String lang, HumanVoiceType type, double rate, String tag, String starName}) {

  }

  void stopTTS() {
  }
  Map<String, dynamic> openParaphraseDetail(String word, String langFrom, String langTo, String itemId) {

  }
  void openSystemSetting() {
  }

  void keepScreenOn() {
  }

  void keepScreenOff() {
  }

  Map<String, dynamic> getVolume() {
  }
  void playVoice(String path, String name) {
  }
  void pauseVoice() {
  }
  void stopVoice() {
  }
  Map<String, dynamic> isNetworkConnection() {

  }
  void log(String type, String name, {Map<String, dynamic> params}) {

  }
  Map<String, dynamic> deviceName() {

  }

  Map<String, dynamic> getSentence() {

  }

  Map<String, dynamic> getUserId() {
    
  }

  Map<String, dynamic> getYdUserId() {

  }
  
  Map<String, dynamic> product() {

  }

  Map<String, dynamic> getFlutterBoostPageCount() {

  }

  Map<String, dynamic> isDebugMode() {

  }

  Map<String, dynamic> openReadAfterPage(String readText, String readTextTrans, String readTextLangCode, String readTextTransCode, String voiceUrl ) {

  }

  void openWordVideo(String word, String json){}

  void openAITeacher(String word, String lang, {Map<String, dynamic> params}){}
}