import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class acceuil extends StatefulWidget {
  @override
  _acceuilState createState() => _acceuilState();
}

class _acceuilState extends State<acceuil> {
   bool chargement =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffb85e0f ),
        title: Text("Site d'UVS"),
        centerTitle: true,
      ),
      body: Stack(
        children:<Widget> [
          WebView(
            initialUrl: "https://www.uvs.sn",
            onPageFinished: (finish){
              setState(() {
                chargement=false;
              });
            },
          ),
          chargement ? Center( child: CircularProgressIndicator(),)
              : Stack(),
        ],
      )
    );
  }
}
