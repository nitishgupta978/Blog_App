// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:singup_app/BackGroundLogo.dart';
import 'package:velocity_x/velocity_x.dart';
import 'BackGroundLogo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sing in Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(title: 'Sing in Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required String title}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0XFFFFB6C1), Color(0XFFFFB6C1)],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomCenter,
            stops: [0.0, 0.8],
            tileMode: TileMode.mirror),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 450,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const BackGroundLogo(),
                const HeightBox(10),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white60,
                      label: Text('email'),
                      hintText: "abc@gmail.com",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white60,
                      label: Text('password'),
                      hintText: "********",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                ),
                TextButton(
                  child: const Text('Sing in'),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 30.0,
                ),
                RichText(
                    text: const TextSpan(
                  text: "here you sing in your account?",
                  // ignore: unnecessary_const
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.cyan)),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
