import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'pages/webview.dart';


void main() {
  debugPaintSizeEnabled = false;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'webview',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routes:{
      '/':(BuildContext context) => Webview(),
    },
    initialRoute: '/',
  ));
}