import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class portail extends StatefulWidget {
  @override
  _portailState createState() => _portailState();
}

class _portailState extends State<portail> {
  bool chargement = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          InAppWebView(
            initialUrl: "https://portail.uvs.sn",
            onLoadStart: (InAppWebViewController controller, String url) {},
            onLoadStop: (InAppWebViewController controller, String url) {
              setState(() {
                chargement = false;
              });
            },
          ),
          chargement
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      )),
    );
  }
}
