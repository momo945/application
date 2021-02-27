import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class mail extends StatelessWidget {
  _messageUVS() async {
    const url = "mailto:scolarite@uvs.edu.sn";
    if (await (canLaunch(url))) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff041289),
        title: Text("Réclamation"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/mail.jpg"), fit: BoxFit.cover)),
          ),
          Center(
            child: RaisedButton.icon(
              onPressed: _messageUVS,
              icon: Icon(Icons.mail),
              label: Text("Contacter UVS pour vos réclamations"),
            ),
          )
        ],
      ),
    );
  }
}
