import 'package:flutter/foundation.dart';

class Plat {
  int quantite;
  String name;
  int price;
  String description;
  String urlTof;
  Plat(
      {@required this.name,
      @required this.quantite,
      @required this.price,
      @required this.description,
      @required this.urlTof});
}
