import 'dart:async';

import 'package:flutter/services.dart';

class Meiqiachat {
  static const MethodChannel _channel = const MethodChannel('meiqiachat');

  /// 初始化美洽sdk 
  static Future<void> initMeiqiaSdkWith(String appkey) async {
    await _channel.invokeMethod('initMeiqiaSdk', appkey);
  }
  /// 初始化聊天页面 isPush 为 iOS 跳转方式 默认present
  static Future<void> toChat({bool isPush}) async {
    await _channel.invokeMethod('toChat', isPush);
  }
  
}
