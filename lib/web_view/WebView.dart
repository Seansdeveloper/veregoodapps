




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Condition extends StatefulWidget {
  final String pageName;
  final String url;
  Condition(this.pageName, this.url);



  @override
  State<Condition> createState() => _ConditionState();
}

class _ConditionState extends State<Condition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.pageName),
      ),
      body:  WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
