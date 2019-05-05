import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

bool flag = false;

class Webview extends StatelessWidget {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {

    return new WillPopScope(
        child: new Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(0.0, 23.0, 0.0, 0.0),
          child: new WebviewScaffold(
            url: "https://flutter.dev/",
            withZoom: false,
            withLocalStorage: true,
            hidden: false,
            withJavascript: true,
            scrollBar: false,
          ),
        ),
        onWillPop: () {
          Fluttertoast.showToast(
              msg: "再次点击返回退出~",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
          print("再次点击返回退出");

          if(flag){
            print("exit");
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }else{
            flutterWebViewPlugin.goBack();
            flag = true;
            new Future.delayed(const Duration(milliseconds: 1000)).then((_) {
              flag = false;
            });
          }
        }
    );
  }
}


