import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//thiey xaliss compagnon de guerre
class bourse extends StatefulWidget {
  @override
  _bourseState createState() => _bourseState();
}

class _bourseState extends State<bourse> {
  bool chargement = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WebView(
          initialUrl: "https://www.directiondesbourses.sn/profil",
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish) {
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
    );
  }
}
