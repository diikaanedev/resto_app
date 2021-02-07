import 'package:big_faim/utils/colors-dii.dart';
import 'package:big_faim/utils/text-description.dart';
import 'package:big_faim/widget/card-menu-categorie.dart';
import 'package:flutter/material.dart';

_HomeScreenState homeScreenState;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    homeScreenState = _HomeScreenState();
    return homeScreenState;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  Size size;
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
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      height: size.height * .4,
                      width: size.width,
                      // color: Colors.yellow,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          height: size.height * .4,
                          width: size.width * .97,
                          child: Row(
                            children: [
                              Spacer(),
                              CardCategorieMenu(
                                description: description_entrefroide,
                                titre: 'Entrée Froide',
                                urlTof:
                                    'assets/images/entrees_froides/salade big faim.jpg',
                              ),
                              Spacer(),
                              Spacer(),
                              CardCategorieMenu(
                                description: description_entre_chaude,
                                titre: 'Entrée Chaude',
                                urlTof:
                                    'assets/images/entrees_chaudes/salade_de_chevre.jpg',
                              ),
                              Spacer()
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * .4,
                      width: size.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          height: size.height * .4,
                          width: size.width * .97,
                          child: Row(
                            children: [
                              Spacer(),
                              CardCategorieMenu(
                                description: description_crepe,
                                titre: 'Volailles',
                                urlTof:
                                    'assets/images/volaille/escaloppe_poulet.jpeg',
                              ),
                              Spacer(),
                              Spacer(),
                              CardCategorieMenu(
                                description: description_poissons,
                                titre: 'Poissons',
                                urlTof:
                                    'assets/images/poisson/grillade_daurade.jpg',
                              ),
                              Spacer()
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * .4,
                      width: size.width,
                      // color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          height: size.height * .4,
                          width: size.width * .97,
                          child: Row(
                            children: [
                              Spacer(),
                              CardCategorieMenu(
                                description: description_crepe,
                                titre: 'Crêpe',
                                urlTof: 'assets/images/crepes/crepe.jpg',
                              ),
                              Spacer(),
                              Spacer(),
                              CardCategorieMenu(
                                description: description_pate,
                                titre: 'Pate',
                                urlTof: 'assets/images/pates/tagliatelle.jpg',
                              ),
                              Spacer()
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * .4,
                      width: size.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          height: size.height * .4,
                          width: size.width * .97,
                          child: Row(
                            children: [
                              Spacer(),
                              CardCategorieMenu(
                                description: description_crepe,
                                titre: 'Viandes',
                                urlTof: 'assets/images/5.png',
                              ),
                              Spacer(),
                              Spacer(),
                              CardCategorieMenu(
                                description: description_pate,
                                titre: 'Desserts',
                                urlTof: 'assets/images/4.png',
                              ),
                              Spacer()
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * .4,
                      width: size.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          height: size.height * .4,
                          width: size.width * .97,
                          child: Row(
                            children: [
                              Spacer(),
                              CardCategorieMenu(
                                description: description_crepe,
                                titre: 'Specialite',
                                urlTof: 'assets/images/5.png',
                              ),
                              Spacer(),
                              Spacer(),
                              CardCategorieMenu(
                                description: description_pate,
                                titre: 'Desserts',
                                urlTof: 'assets/images/4.png',
                              ),
                              Spacer(),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
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
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: size.height * .03,
                        width: size.width * .7,
                        child: Text(
                          'Hôtel Big Faim',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14, color: SECONDAIRE),
                        ),
                      ),
                      // Spacer(),
                      Container(
                        height: size.height * .03,
                        width: size.width * .7,
                        // color: Colors.red,
                        child: Text(
                          'Av Léopold Sédar Senghor, Thiès, Sénégal',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14, color: SECONDAIRE),
                        ),
                      ),
                      // Spacer(),
                      Container(
                        height: size.height * .03,
                        width: size.width * .7,
                        child: Text(
                          'Tél. : 33 952 06 22 / 77 651 44 01',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14, color: SECONDAIRE),
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
                child: Center(
                  child: Text(
                    'Votre Menu'.toUpperCase(),
                    style: TextStyle(
                        color: SECONDAIRE,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )),
          Positioned(
              left: size.width * .1,
              top: size.height * .195,
              child: Container(
                height: .5,
                width: size.width * .8,
                color: Colors.grey,
              )),
          Positioned(
              left: size.width * .3,
              top: size.height * .195 - 2,
              child: Container(
                height: 5,
                width: size.width * .4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: PRIMAIRE,
                ),
              )),
        ],
      ),
    );
  }
}
