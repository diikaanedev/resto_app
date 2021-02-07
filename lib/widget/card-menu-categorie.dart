import 'package:big_faim/data/list-plat.dart';
import 'package:big_faim/main.dart';
import 'package:big_faim/utils/colors-dii.dart';
import 'package:big_faim/utils/text-by-dii.dart';
import 'package:flutter/material.dart';

class CardCategorieMenu extends StatefulWidget {
  final String urlTof;
  final String titre;
  final String description;

  const CardCategorieMenu({Key key, this.urlTof, this.titre, this.description})
      : super(key: key);
  @override
  _CardCategorieMenuState createState() => _CardCategorieMenuState();
}

class _CardCategorieMenuState extends State<CardCategorieMenu> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        switch (widget.titre) {
          case 'Entrée Froide':
            appState.setState(() {
              appState.listeDesPlatCategorie = listePlatEntreeFroide;
            });
            break;
          case 'Entrée Chaude':
            appState.setState(() {
              appState.listeDesPlatCategorie = listePlatEntreChaude;
            });
            break;
          case 'Crêpe':
            appState.setState(() {
              appState.listeDesPlatCategorie = listeCrepes;
            });
            break;
          case 'Pate':
            appState.setState(() {
              appState.listeDesPlatCategorie = listePates;
            });
            break;
          case 'Volailles':
            appState.setState(() {
              appState.listeDesPlatCategorie = listeVolailles;
            });
            break;
          case 'Poissons':
            appState.setState(() {
              appState.listeDesPlatCategorie = listePoisson;
            });
            break;
          case 'Viandes':
            appState.setState(() {
              appState.listeDesPlatCategorie = listeViandes;
            });
            break;
          case 'Desserts':
            appState.setState(() {
              appState.listeDesPlatCategorie = listeDesserts;
            });
            break;
          case 'Specialite':
            appState.setState(() {
              appState.listeDesPlatCategorie = listeSpecialiteDeLaMer;
            });
            break;
          default:
            appState.setState(() {
              appState.listeDesPlatCategorie = [];
            });
            break;
        }
        appState.setState(() {
          appState.categorie_titre = widget.titre;
          appState.screen = 1;
        });
      },
      child: Stack(
        children: [
          Container(
            height: size.height * .36,
            width: size.width * .4,
            // color: SECONDAIRE,
          ),
          Positioned(
              top: size.height * .025,
              // left: size.width* .025,
              child: Container(
                height: size.height * .25,
                width: size.width * .4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage(widget.urlTof), fit: BoxFit.cover)),
              )),
          Positioned(
              top: size.height * .01,
              left: size.width * .025,
              child: Container(
                height: size.height * .04,
                width: size.width * .35,
                // color: SECONDAIRE,
                child: Row(
                  children: [
                    Spacer(),
                    Spacer(),
                    Container(
                      width: size.width * .03,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/icon-pakka_coudou.png'))),
                    ),
                    SizedBox(
                      width: size.width * .02,
                    ),
                    Container(
                      // width: size.width * .28,
                      child: Center(
                        child: Text(
                          '${widget.titre}',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: SECONDAIRE),
                        ),
                      ),
                    ),
                    Spacer(),
                    Spacer(),
                  ],
                ),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(150),
                  image: DecorationImage(
                      image: AssetImage('assets/images/cercle.png'),
                      fit: BoxFit.contain),
                  // color: Colors.red,
                ),
              )),
          Positioned(
              // left: size.width* .025,
              top: size.height * .27,
              child: Container(
                height: size.height * .07,
                width: size.width * .4,
                child: Center(
                  child: Text(
                    '${subStringBydii(widget.description)}',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: SECONDAIRE),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ))
        ],
      ),
    );
  }
}
