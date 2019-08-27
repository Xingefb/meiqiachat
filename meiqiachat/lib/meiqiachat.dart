import 'dart:async';

import 'package:flutter/services.dart';

class Meiqiachat {
  static const MethodChannel _channel =
      const MethodChannel('meiqiachat');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> initMeiqiaSdkWith(String appkey) async {
    final bool isSuccess = await _channel.invokeMethod('initMeiqiaSdk',appkey);
    return isSuccess;
  }

  static Future<bool> toChat({String appkey}) async {
    final bool isSuccess = await _channel.invokeMethod('toChat');
    return isSuccess;
  }

}
