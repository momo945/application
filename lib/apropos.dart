import 'package:flutter/material.dart';

class apropos extends StatelessWidget {
  //rang moy done page contact rannnnnnnnnnnnnnng
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff041289),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "A propos",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              ),
              Text(
                  "Link est une application créée par des jeunes étudiants de la promo 6 connue sous le nom de GENIE DEV(ENO de Keur Massar)."
                  "Cette application permet aux étudiants d'avoir accès aux plateformes et à au portail d'UVS ,de voir la disponibilité de leur bourse, de naviguer sur Google etc..."
                  "En effet Link est une application web simple est facile à utilisé et concu pour les étudiants de l'UVS."
                  " Max de partage pour nous soutenir. "
                  "Link sera amélioré au fil du temps."),
              Text(
                "Conditions d'utilisations",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              ),
              Text(
                  "Toute utilisation ou reproduction totale, partielle sous une quelconque forme de cette application ou de son contenue est strictement interdite et soumise à une autorisation préalable des éxpediteurs."),
              Text(
                "Contact",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              ),
              Text(
                  "Vous pouvez nous contacter sur WhatsApp où nous appelez avec ce numéro"),
              Text(
                "Modou Diop 780197660",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Ou nous envoyer un mail avec cette adresse"),
              Text(
                "Geniedeveloppeur@gmail.com",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
