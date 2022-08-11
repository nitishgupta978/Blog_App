import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'BackGroundLogo.dart';
import 'LoginPage.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Signup Page')),
        body: SingleChildScrollView(
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
                  ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginPage(title: 'LoginPage');
                      }));
                    },
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
        ));
  }
}
