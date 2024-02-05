import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'js_bridge_module.dart';



Builder getJSBridgeImpGeneratorBuilder(BuilderOptions options) {

  return jsonPartBuilder();
}

Builder jsonPartBuilder(
    {String formatOutput(String code)}) {

  return SharedPartBuilder([
    JSBridgeImplGenerator()
  ], 'flutter_jsbridge_builder', formatOutput: formatOutput);
}




class JSBridgeImplGenerator
    extends GeneratorForAnnotation<JSBridgeModule> {

  JSBridgeImplGenerator() {}


  @override
  Iterable<String> generateForAnnotatedElement (
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      final name = element.name;
      throw InvalidGenerationSourceError('Generator cannot target `$name`.',
          todo: 'Remove the JsonSerializable annotation from `$name`.',
          element: element);
    }
    final classElement = element as ClassElement;
    String moduleName =  annotation.read('moduleName').stringValue;
    List<DartObject> enumTypeName = annotation.read('enumTypeName').listValue;
    List<String> checkEnumTypeName = [];
    enumTypeName.forEach((m){
      checkEnumTypeName.add(m.toStringValue());
    });
    return _generate(classElement, moduleName, enumTypeName: checkEnumTypeName);
  }


//  var _addedMembers = Set<String>();


  Iterable<String> _generate(ClassElement element, String moduleName, {List<String> enumTypeName = const []}) sync* {
    Set<String> _addedMembers = Set<String>();
    _addedMembers.add("// **************************************************************************"
        "\n// 这里面的代码，不要手动改，改完运行，flutter packages pub run build_runner build命令还会回来"
              "\n// **************************************************************************");
    _addedMembers.add("class YD"+ element.name + "{");
    element.methods.forEach((methodElement) {
      _addedMembers.add("static Future<" + methodElement.returnType.getDisplayString(withNullability: false) + "> " +  methodElement.name + MethodParams(methodElement) + " async " + "{"
          + "CallToNative call = CallToNative();"
          "call.module = \""+ moduleName +"\";"
          "call.func = \""+ methodElement.name +"\";"
          "call.args = {" + paramToNative(methodElement, enumTypeName : enumTypeName) +"};"
          "call.handlerId = JSBridgeCore.getHandlerID();"
          "JSBridgeCore.callbackMap[call.handlerId] = Completer<CallFromNative>();"
          "JSBridgeCore.sendMsg(call);"
          "CallFromNative nativeCall = await JSBridgeCore.callbackMap[call.handlerId].future;"
          "if(nativeCall.err == null || nativeCall.err.length == 0) {"
          "return nativeCall.args;"
          "} else {"
          " throw nativeCall.err;"
          "}" +
          "}");
    });
    _addedMembers.add("}");
    yield* _addedMembers;
  }
  
  String MethodParams(MethodElement m) {
    String params = "(";
    bool isHasBrackets = false;
    bool isFirst = true;
    for (ParameterElement element in m.parameters) {
      var str = element.getDisplayString(withNullability: false);
      if (str.startsWith("{") == true){
        isHasBrackets = true;
        if (isFirst == false) {
          str = str.replaceAllMapped("{",(m){
            return "";
          });
        }
        isFirst = false;
      }
      params += str += ",";
    }
    params = params.replaceAllMapped("}",(m){
      return "";
    });
    if (isHasBrackets) {
      params += "}";
    }
    params += ")";
    return params;
  }

  String paramToNative(MethodElement m, {List<String> enumTypeName = const []}) {
    List<String> list = m.parameters.map((param) {
      if (enumTypeName.length > 0) {
        var str = "\"" + param.name + "\"" + ":" + param.name;
        for (String e in enumTypeName) {
          if (e == param.type.getDisplayString(withNullability: false)) {
            str += "?.index";
            break;
          }
        }
        return str;
      }
      return "\"" + param.name + "\"" + ":" + param.name;
    } ).toList();
    String str = "";
    list.forEach((s) {
      s += ",";
      str += s ;
    });
    return str;
  }
  
}


