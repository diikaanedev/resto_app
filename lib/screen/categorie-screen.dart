import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:big_faim/main.dart';
import 'package:big_faim/utils/colors-dii.dart';
import 'package:big_faim/utils/web-by-dii.dart';
import 'package:big_faim/widget/card-categorie-plat-liste-cmd.dart';
import 'package:big_faim/widget/card-categorie-plat.dart';
import 'package:flutter/material.dart';

_CategorieScreenState categorieScreenState;

class CategorieScreen extends StatefulWidget {
  @override
  _CategorieScreenState createState() {
    categorieScreenState = _CategorieScreenState();
    return categorieScreenState;
  }
}

class _CategorieScreenState extends State<CategorieScreen> {
  Size size;
  bool isSelctPanier = false;
  bool showDialogCmd = false;
  bool showDialogCmdValid = true;
  bool chargement = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
          ),
          Positioned(
              top: size.height * .2,
              child: Container(
                height: size.height * .8,
                width: size.width,
                // color: SECONDAIRE,
                child: !isSelctPanier
                    ? ListView(
                        physics: BouncingScrollPhysics(),
                        children: getListPlat(),
                      )
                    : Column(
                        children: [
                          Container(
                            height: size.height * .07,
                            width: size.width,
                            color: PRIMAIRE,
                            child: Row(
                              children: [
                                Spacer(),
                                Container(
                                  width: size.width * .2,
                                  child: Center(
                                    child: Text(
                                      'Quantité',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: size.width * .3,
                                  child: Center(
                                    child: Text(
                                      'Votre Commande',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: size.width * .25,
                                  child: Center(
                                    child: Text(
                                      'Montant(XOF)',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * .4,
                            // color: SECONDAIRE,
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              children: getListPlatCMD(),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .03,
                          ),
                          Container(
                            height: size.height * .07,
                            width: size.width,
                            // color: SECONDAIRE,
                            child: Row(
                              children: [
                                Spacer(),
                                Container(
                                  width: size.width * .3,
                                  child: Center(
                                    child: Text('Votre addition'),
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Container(
                                  height: size.height * .03,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  ' ${oCcy.format(appState.priceCmd)} ',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '(XOF)',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w100),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: size.height * .07,
                            width: size.width,
                            child: Row(
                              children: [
                                Spacer(),
                                GestureDetector(
                                  onTap: () async {
                                    Random rnd;
                                    int min = 1;
                                    int max = 10;
                                    rnd = new Random();
                                    setState(() {
                                      chargement = true;
                                    });
                                    String descriptionCmd = '';
                                    for (var item in appState.listeCmd) {
                                      descriptionCmd +=
                                          '${item.name}#${item.quantite}|';
                                    }
                                    UtilsHttp.postByIssa({
                                      'prix': '${appState.priceCmd}',
                                      'table':
                                          '${min + rnd.nextInt(max - min)}',
                                      'listePlat': '$descriptionCmd'
                                    }).then((result) {
                                      var info = json.decode(result.body);

                                      if (info['statusCode'] == 200) {
                                        setState(() {
                                          showDialogCmd = true;
                                          showDialogCmdValid = true;
                                          chargement = false;
                                        });

                                        Timer(Duration(seconds: 5), () {
                                          setState(() {
                                            showDialogCmd = false;
                                          });
                                        });
                                      } else {
                                        setState(() {
                                          showDialogCmd = true;
                                          showDialogCmdValid = false;
                                          chargement = false;
                                        });
                                        Timer(Duration(seconds: 5), () {
                                          setState(() {
                                            showDialogCmd = false;
                                          });
                                        });
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: size.width * .5,
                                    height: size.height * .06,
                                    child: Center(
                                      child: !chargement
                                          ? Text(
                                              'Passer la Commande',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w200,
                                                  color: SECONDAIRE),
                                            )
                                          : Container(
                                              height: 30,
                                              width: 30,
                                              child: CircularProgressIndicator(
                                                backgroundColor: PRIMAIRE,
                                                valueColor:
                                                    new AlwaysStoppedAnimation<
                                                        Color>(SECONDAIRE),
                                              ),
                                            ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: PRIMAIRE),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * .03,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
              )),
          Positioned(
              child: Container(
            height: size.height * .15,
            width: size.width,
            // color: PRIMAIRE,
            child: Row(
              children: [
                Spacer(),
                Container(
                  width: size.width * .2,
                  height: size.height * .14,
                  decoration: BoxDecoration(
                      // color: PRIMAIRE,
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo_normal.png'))),
                ),
                Spacer(),
                Container(
                  width: size.width * .7,
                  // color: SECONDAIRE,
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: size.height * .08,
                        child: Row(
                          children: [
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Text(
                              'Votre addition',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: size.height * .03,
                              width: 1,
                              color: Colors.black,
                            ),
                            Container(
                              width: size.width * .35,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${oCcy.format(appState.priceCmd)}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: SECONDAIRE),
                                  ),
                                  Text(
                                    'XOF',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200,
                                        color: SECONDAIRE),
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: size.height * .05,
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * .05,
                            ),
                            GestureDetector(
                              onTap: () {
                                appState.setState(() {
                                  appState.screen = 0;
                                });
                              },
                              child: Container(
                                child: Text(
                                  'Retour au Menu',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Spacer()
              ],
            ),
          )),
          Positioned(
              top: size.height * .15,
              child: Container(
                height: size.height * .05,
                width: size.width,
                // color: PRIMAIRE,
                child: Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelctPanier = false;
                        });
                      },
                      child: Container(
                        width: size.width * .3,
                        child: Text(
                          appState.categorie_titre.toUpperCase(),
                          style: TextStyle(
                              color: SECONDAIRE,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelctPanier = true;
                        });
                      },
                      child: Container(
                        width: size.width * .51,
                        child: Text(
                          'Valider Votre Commande'.toUpperCase(),
                          style: TextStyle(
                              color: SECONDAIRE,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              )),
          Positioned(
              left: size.width * .05,
              top: size.height * .195,
              child: Container(
                height: .5,
                width: size.width * .9,
                color: Colors.grey,
              )),
          !isSelctPanier
              ? Positioned(
                  left: size.width * .05,
                  top: size.height * .195 - 2,
                  child: Container(
                    height: 5,
                    width: size.width * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: PRIMAIRE,
                    ),
                  ))
              : Container(),
          isSelctPanier
              ? Positioned(
                  left: size.width * .42,
                  top: size.height * .195 - 2,
                  child: Container(
                    height: 5,
                    width: size.width * .5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: PRIMAIRE,
                    ),
                  ))
              : Container(),
          showDialogCmd
              ? Positioned(
                  bottom: 0,
                  left: size.width * .1,
                  child: Container(
                    height: size.height * .06,
                    width: size.width * .8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: SECONDAIRE,
                    ),
                    child: Center(
                      child: Text(
                        showDialogCmdValid
                            ? 'commande Passée avec succes'
                            : 'Erreur survenue réessayer',
                        style: TextStyle(fontSize: 20, color: PRIMAIRE),
                      ),
                    ),
                  ))
              : Container()
        ],
      ),
    );
  }

  List<Widget> getListPlat() {
    List<Widget> liste = [];
    for (var item in appState.listeDesPlatCategorie) {
      liste.add(CardCategoriePlat(
        plat: item,
      ));
    }
    liste.add(SizedBox(
      height: size.height * .01,
    ));
    return liste;
  }

  List<Widget> getListPlatCMD() {
    List<Widget> liste = [];

    for (var i = 0; i < appState.listeCmd.length; i++) {
      if (i % 2 == 0) {
        liste.add(CardCategoriePlatListCmd(
          isActive: true,
          plat: appState.listeCmd[i],
        ));
      } else {
        liste.add(CardCategoriePlatListCmd(
          isActive: false,
          plat: appState.listeCmd[i],
        ));
      }
    }

    liste.add(SizedBox(
      height: size.height * .01,
    ));
    return liste;
  }
}
