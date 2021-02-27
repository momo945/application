import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class recherche extends StatefulWidget {
  @override
  _rechercheState createState() => _rechercheState();
}

class _rechercheState extends State<recherche> {
  InAppWebViewController webView;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool chargement;
//le fonction
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        setState(() {
          webView.goBack();
        });
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff041289),
          title: Text("Recherche"),
          centerTitle: true,
        ),
        body: InAppWebView(
          initialUrl: "https://www.google.com",
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
                debuggingEnabled: true, useOnDownloadStart: true),
          ),
          onWebViewCreated: (InAppWebViewController controller) {
            webView = controller;
          },
          onLoadStart: (InAppWebViewController controller, String url) {
            setState(() {
              CircularProgressIndicator();
            });
          },
          onLoadStop: (InAppWebViewController controller, String url) {
            setState(() {});
          },
          onDownloadStart: (controller, url) async {
            print("telechargement $url");
            final taskId = await FlutterDownloader.enqueue(
              url: url,
              savedDir: (await getExternalStorageDirectory()).path,
              showNotification: true, // la notification du telechargement
              openFileFromNotification: true,
              //pour ouvrir le fichier telecharger
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            //icons menue sur la page de l'pplication
            backgroundColor: Color(0xff041289).withOpacity(0.30),
            child: IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: () {
                //fonction retournet sur la page d'acceuil main
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            )),
      ),
    );
  }
}
