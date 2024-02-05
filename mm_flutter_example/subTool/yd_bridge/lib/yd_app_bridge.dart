library yd_bridge;
import 'dart:ffi';

import 'package:flutter_jsbridge_builder/js_bridge_module.dart';
import 'yd_js_bridge.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert';

/// A Calculator.
///
part 'yd_app_bridge.g.dart';

@JSBridgeModule(moduleName: "app")
class AppBridge {

      Map<String, dynamic> alert(String title, String desc, List<Map<String,String>> actions) {

      }

      Map<String, dynamic> request(String path, Map<String, dynamic> params, String method, int timeout) {

      }

      Map<String, dynamic> toast(String text) {

      }
      
      Map<String, dynamic> close() {
      }

      Map<String, dynamic> log(String actions, Map<String,dynamic> attributes) {

      }
}


