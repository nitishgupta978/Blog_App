// ignore: file_names

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

//import 'package:singup_app/asserts/InstLogo2.png';
class BackGroundLogo extends StatelessWidget {
  const BackGroundLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "assets/images/InstLogo2.png",
          width: 180,
          //height: 100,
        ),
        //"Sing Up".text.xl2.italic.make(),
        "Welcome ".text.cyan900.wider.lg.make(),
      ],
    );
  }
}
