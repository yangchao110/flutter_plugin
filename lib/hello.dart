
import 'dart:async';
import 'dart:ffi';

import 'package:flutter/services.dart';

class Hello {
  static const MethodChannel _channel = MethodChannel('hello');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> init(String appkey) async{
    _addNativeHandlers();
     final String? init  = await _channel.invokeMethod('init',appkey);
     return init;
  }
  
  static Future<String?> config(String appkey) async{
     final String? init  = await _channel.invokeMethod('config',appkey);
     return init;
  }

  static void _addNativeHandlers(){
    _channel.setMethodCallHandler((MethodCall call) {
        switch(call.method){
           case "configCallBack":
           String value = call.arguments;
           print("flutter receive method call value ${value}");
           break;
           default:
        }
        return Future.value(null);
    });
  }
}
