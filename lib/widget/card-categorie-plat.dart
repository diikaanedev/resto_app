import 'package:big_faim/main.dart';
import 'package:big_faim/models/plat.dart';
import 'package:big_faim/utils/colors-dii.dart';
import 'package:flutter/material.dart';

class CardCategoriePlat extends StatefulWidget {
  final Plat plat;

  const CardCategoriePlat({Key key, this.plat}) : super(key: key);
  @override
  _CardCategoriePlatState createState() => _CardCategoriePlatState();
}

class _CardCategoriePlatState extends State<CardCategoriePlat> {
  Size size;
  Plat platItem;
  int prix;
  @override
  void initState() {
    setState(() {
      platItem = widget.plat;
      prix = widget.plat.price;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * .4,
          width: size.width,
          color: Colors.white,
        ),
        Positioned(
            top: size.height * .03,
            left: size.width * .05,
            child: Container(
              height: size.height * .35,
              width: size.width * .4,
              // color: SECONDAIRE,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage(widget.plat.urlTof),
                      fit: BoxFit.cover)),
            )),
        Positioned(
            top: size.height * .03,
            left: size.width * .47,
            child: Container(
              height: size.height * .06,
              width: size.width * .5,
              // color: SECONDAIRE,
              child: Center(
                child: Text(
                  '${widget.plat.name}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: SECONDAIRE),
                ),
              ),
            )),
        Positioned(
            top: size.height * .075,
            left: size.width * .455,
            child: Container(
              height: size.height * .05,
              width: size.width * .5,
              // color: SECONDAIRE,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * .03,
                  ),
                  Text(
                    'Ingrédients : ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  // Text('Citron - '),
                  // Text('Salade de mer - '),
                ],
              ),
            )),
        Positioned(
            top: size.height * .115,
            left: size.width * .48,
            child: Container(
              height: size.height * .05,
              width: size.width * .5,
              // color: SECONDAIRE,
              child: Text(
                '${widget.plat.description}',
                style: TextStyle(fontSize: 12),
              ),
            )),
        Positioned(
            top: size.height * .165,
            left: size.width * .48,
            child: Container(
              height: size.height * .07,
              width: size.width * .5,
              // color: SECONDAIRE,
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    width: size.width * .15,
                    child: Center(
                      child: Text(
                        'Prix',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Container(
                    height: size.height * .04,
                    width: 1,
                    color: Colors.black,
                  ),
                  Spacer(),
                  Container(
                    width: size.width * .3,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${oCcy.format(prix)} ',
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
                  Spacer()
                ],
              ),
            )),
        Positioned(
            top: size.height * .225,
            left: size.width * .48,
            child: Container(
              height: size.height * .07,
              width: size.width * .5,
              // color: SECONDAIRE,
              child: Row(
                children: [
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (platItem.quantite > 1) {
                        setState(() {
                          platItem.quantite--;
                          prix = platItem.price * platItem.quantite;
                        });
                      }
                    },
                    child: Container(
                      width: size.width * .1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Icon feather-minus-square.png'))),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: size.width * .1,
                    // color: SECONDAIRE,
                    child: Center(
                      child: Text(
                        '${platItem.quantite}',
                        style: TextStyle(
                            fontSize: 24,
                            color: SECONDAIRE,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        platItem.quantite++;
                        prix = platItem.price * platItem.quantite;

                        // platItem.price = widget.plat.price * platItem.quantite;
                      });
                    },
                    child: Container(
                      width: size.width * .1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Icon feather-plus-square.png'))),
                    ),
                  ),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                ],
              ),
            )),
        Positioned(
            top: size.height * .32,
            left: size.width * .48,
            child: Container(
              height: size.height * .05,
              width: size.width * .5,
              // color: SECONDAIRE,
              child: Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        platItem.price = prix;
                      });
                      appState.setState(() {
                        appState.listeCmd.add(platItem);
                      });
                      for (var item in appState.listeCmd) {
                        appState.setState(() {
                          appState.priceCmd += item.price;
                        });
                      }
                    },
                    child: Container(
                      width: size.width * .45,
                      child: Center(
                        child: Text(
                          'Ajouter à la table',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                              color: SECONDAIRE),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: PRIMAIRE,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ))
      ],
    );
  }
}
