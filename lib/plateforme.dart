import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class plateforme extends StatefulWidget {
  @override
  _plateformeState createState() => _plateformeState();
}

class _plateformeState extends State<plateforme> {
  InAppWebViewController webView;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool chargement = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //cette focntion permet de retourner sur les pages web
      onWillPop: () {
        setState(() {
          webView.goBack();
        });
      },
      child: Stack(
        //stact permet de voir le chagement de navigateur
        children: <Widget>[
          InAppWebView(
            initialUrl: "https://formation.uvs.sn",
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                  javaScriptEnabled: true,
                  supportZoom: true,
                  debuggingEnabled: true,
                  useOnDownloadStart: true),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadStart: (InAppWebViewController controller, String url) {
              chargement = true;
            },
            onLoadStop: (InAppWebViewController controller, String url) {
              setState(() {
                chargement = false;
              });
            },
            androidOnPermissionRequest: (InAppWebViewController controller,
                String origin, List<String> resources) async {
              return PermissionRequestResponse(
                  resources: resources,
                  action: PermissionRequestResponseAction.GRANT);
            },
            onDownloadStart: (controller, url) async {
              print("telechargement $url");
              final taskId = await FlutterDownloader.enqueue(
                url: url,
                savedDir: (await getExternalStorageDirectory()).path,
                showNotification: true, // la notification du telechargement
                openFileFromNotification:
                    true, //pour ouvrir le fichier telecharger
              );
            },
          ),
          chargement
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
