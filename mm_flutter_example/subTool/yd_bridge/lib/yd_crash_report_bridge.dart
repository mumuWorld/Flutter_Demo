
import 'package:flutter_jsbridge_builder/js_bridge_module.dart';
import 'yd_js_bridge.dart';
import 'dart:async';

part 'yd_crash_report_bridge.g.dart';

@JSBridgeModule(moduleName: "crash")
class CrashReporterBridge {
  Map<String, dynamic> reportCrash(String name, String reason, String stack) {

  }
}