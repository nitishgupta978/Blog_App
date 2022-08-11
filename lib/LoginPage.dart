import 'package:flutter/material.dart';
import 'package:singup_app/BackGroundLogo.dart';
import 'package:singup_app/BlogPage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'BackGroundLogo.dart';
import 'SignupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required String title}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
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
                ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const BlogPage(title: 'Sing up Page');
                    }));
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  child: const Text('Sign up'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SingUpPage(title: 'Sign up Page');
                    }));
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                RichText(
                    text: const TextSpan(
                  text: "here you sing in your account?",
                  // ignore: unnecessary_const
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.cyan)),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
