import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class notes extends StatefulWidget {
  @override
  _notes createState() => _notes();
}

class _notes extends State<notes> {
  bool chargement = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Mes notes"),
            backgroundColor: Color(0xff041289),
            centerTitle: true,
          ),
          body: Stack(
            children: <Widget>[
              InAppWebView(
                initialUrl: "https://portail.uvs.sn/affichage-note",
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
