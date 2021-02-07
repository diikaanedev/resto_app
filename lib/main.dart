import 'package:big_faim/models/plat.dart';
import 'package:big_faim/screen/categorie-screen.dart';
import 'package:big_faim/screen/home-screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

_MyAppState appState;

final oCcy = new NumberFormat("#,###", "en_US");

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() {
    appState = _MyAppState();
    return appState;
  }
}

class _MyAppState extends State<MyApp> {
  int screen = 0;
  String categorie_titre = '';
  List<Plat> listeDesPlatCategorie = [];
  List<Plat> listeCmd = [];

  int priceCmd = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Big Faim',
      home: screen == 0
          ? HomeScreen()
          : screen == 1
              ? CategorieScreen()
              : Container(),
      theme: ThemeData(fontFamily: 'Segoe UI'),
    );
  }
}
