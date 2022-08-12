import 'package:flutter/material.dart';
import 'package:singup_app/LoginPage.dart';
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
        title: 'Blog App',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: const LoginPage(
          title: '',
        ));
  }
}
