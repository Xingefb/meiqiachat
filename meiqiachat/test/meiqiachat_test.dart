import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meiqiachat/meiqiachat.dart';

void main() {
  const MethodChannel channel = MethodChannel('meiqiachat');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('initMeiqiaSdkWith', () async {
    expect(await Meiqiachat.initMeiqiaSdkWith('appkey').toString(), (){});
  });
}
