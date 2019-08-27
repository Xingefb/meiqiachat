import 'dart:async';

import 'package:flutter/services.dart';

class Meiqiachat {
  static const MethodChannel _channel = const MethodChannel('meiqiachat');

  static Future<void> initMeiqiaSdkWith(String appkey) async {
    await _channel.invokeMethod('initMeiqiaSdk', appkey);
  }

  static Future<void> toChat({bool isPush}) async {
    await _channel.invokeMethod('toChat', isPush);
  }
}
