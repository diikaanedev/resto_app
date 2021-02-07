import 'package:big_faim/models/plat.dart';
import 'package:big_faim/utils/colors-dii.dart';
import 'package:flutter/material.dart';

class CardCategoriePlatListCmd extends StatefulWidget {
  final bool isActive;
  final Plat plat;

  const CardCategoriePlatListCmd({Key key, this.isActive, this.plat})
      : super(key: key);
  @override
  _CardCategoriePlatListCmdState createState() =>
      _CardCategoriePlatListCmdState();
}

class _CardCategoriePlatListCmdState extends State<CardCategoriePlatListCmd> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: .5),
      child: Container(
        height: size.height * .07,
        width: size.width,
        color: widget.isActive ? TERNAIRE : Colors.white,
        child: Row(
          children: [
            Spacer(),
            Container(
              width: size.width * .2,
              child: Center(
                child: Text(
                  '${widget.plat.quantite}',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
            Spacer(),
            Container(
              width: size.width * .4,
              child: Center(
                child: Text(
                  '${widget.plat.name}',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Spacer(),
            Container(
              width: size.width * .2,
              child: Center(
                child: Text(
                  ' ${widget.plat.price}',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
