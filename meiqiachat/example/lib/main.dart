import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:meiqiachat/meiqiachat.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initMeiqia();
  }

  Future<void> initMeiqia() async {
    try {
      await Meiqiachat.initMeiqiaSdkWith(
          'f5c8d2a0ac4294e654dfba9893295f34');
    } catch (e) {}
  }
  // Platform messages are asynchronous, so we initialize in an async method.
  void _toChat() async {
    await Meiqiachat.toChat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Text('Running on: $_platformVersion\n'),
            FlatButton(
              child: Text('toChat'),
              onPressed: () => _toChat(),
            ),
          ],
        ),
      ),
    );
  }
}
