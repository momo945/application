import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_uvs_app/portail.dart';
import 'package:my_uvs_app/mail.dart';
import 'package:my_uvs_app/Bourse.dart';
import 'package:my_uvs_app/plateforme.dart';
import 'package:my_uvs_app/recherche.dart';
import 'package:my_uvs_app/acceuil.dart';
import 'package:my_uvs_app/apropos.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:my_uvs_app/notes.dart';

Future main() async {
  //pour le telechargement utilite de cette fonction
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  await Permission.storage.request();
  await Permission.camera.request();
  await Permission.microphone.request();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> _page = [
    //list des page dans le bottom navbar pour naviger dans le web
    plateforme(),
    bourse(),
    portail(),
  ];
  int _currentIndex =
      0; //c'est un variable qui nous permet de selection les intem de bottom navigationbar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff041289),
        title: Text("Plateforme"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => recherche()));
            },
          )
        ],
      ),
      body: _page[_currentIndex],
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("./images/uvs.jpg"), fit: BoxFit.cover)),
          ),
          Divider(
            color: Color(0xff041289),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.5, 0, 0, 0),
            child: ListTile(
              title: Text("Acceuil du site d'uvs"),
              leading: Icon(Icons.account_balance),
              selectedTileColor: Color(0xff1f4ac3),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => acceuil(),
                    ));
              },
            ),
          ),
          ListTile(
            title: Text("Mes notes"),
            leading: Icon(Icons.notes),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => notes(),
                  ));
            },
          ),
          ListTile(
            title: Text("Réclamation"),
            leading: Icon(Icons.comment),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => mail(),
                  ));
            },
          ),
          Divider(
            color: Color(0xff041289),
          ),
          ListTile(
            title: Text("A propos"),
            leading: Icon(Icons.assignment),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => apropos(),
                  ));
            },
          ),
          ListTile(
            title: Text("Quitter"),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
          Divider(
            color: Color(0xff041289),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        //la bar de navigation en bas de l'application
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: ("Plateforme"),
            backgroundColor: Color(0xff041289),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: ("Sama bourse"),
              backgroundColor: Color(0xff041289)),
          BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined),
              label: ("Portail uvs"),
              backgroundColor: Color(0xff041289)),
        ],
        onTap: (index) {
          //cetter fonction nous permet de selectionner l'indice de item ou les icon de bottom navbar
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
