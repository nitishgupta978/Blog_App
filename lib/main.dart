// ignore_for_file: avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:singup_app/BackGroundLogo.dart';
import 'package:velocity_x/velocity_x.dart';
import 'BackGroundLogo.dart';
// import 'singup_app/asserts/InstLogo2.png';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sing Up Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SingUpPage(title: 'Sing up Page'),
    );
  }
}

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
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

      //body: Center(
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
                      label: Text('First Name'),
                      hintText: "eg. John",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      // label: Text("First Name ")
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
                      label: Text('Last Name'),
                      hintText: "eg. wick",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      //label: Text("First Name ")
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
                      label: Text('email'),
                      hintText: "abc@gmail.com",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      //label: Text("First Name ")
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

                      //label: Text("First Name ")
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
                      label: Text('re-enter password'),
                      hintText: "********",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      //label: Text("First Name ")
                    ),
                  ),
                ),
                TextButton(
                  child: const Text('Submit'),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 30.0,
                ),
                RichText(
                    text: const TextSpan(
                  text: "here you create your account and?",
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
