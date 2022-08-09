// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class BackGroundLogo extends StatefulWidget {
//   const BackGroundLogo({Key? key}) : super(key: key);

//   @override
//   State<BackGroundLogo> createState() => _BackGroundLogoState();
// }

// class _BackGroundLogoState extends State<BackGroundLogo> {
//   @override
//   Widget build(BuildContext context) {

//   }
// }
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
        Image.network(
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
