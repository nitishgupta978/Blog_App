import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:singup_app/auth/datasource/auth_repository.dart';
import 'package:singup_app/auth/logic/validators.dart';
import 'package:singup_app/back_ground_logo.dart';
import 'package:singup_app/blogs/screens/blogs.dart';
import 'package:singup_app/common/widgets/vertical_spacing.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../back_ground_logo.dart';
import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required String title}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthRepository repo = AuthRepository();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool showPassword = false;

  Future<void> login() async {
    final user = await repo.login(
        email: _emailController.text, password: _passwordController.text);

    if (mounted) {
      if (user != null) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const BlogFeed(
                  title: '',
                )));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("User not found")));
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              key: formKey,
              width: 450,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const BackGroundLogo(),
                  const HeightBox(10),
                  const VerticalSpacing(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        return value?.validateAsEmail();
                      },
                      decoration: const InputDecoration(
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
                  const VerticalSpacing(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        return value.validateAsPassword();
                      },
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          child: showPassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onTap: () {
                            setState(() {
                              // update the state of the widgets
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white60,
                        label: const Text('password'),
                        hintText: "********",
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      login();
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const VerticalSpacing(),
                  RichText(
                    text: TextSpan(
                        text: 'Not a user yet?',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        children: [
                          TextSpan(
                              text: ' Sign Up ',
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const SingUpPage(
                                              title: '',
                                            )),
                                  );
                                }),
                          const TextSpan(text: 'instead.'),
                        ]),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  onPressed: () {
                    launchUrlString("https://www.instagram.com");
                  },
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.pink.shade400,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    launchUrlString("https://www.facebook.com");
                  },
                  icon: const Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.blue, // Icons.facebook,
                    size: 30,
                  ),
                  color: Colors.blue.shade900,
                ),
                IconButton(
                  onPressed: () {
                    launchUrlString("https://www.twitter.com");
                  },
                  icon: const Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.cyan,
                    size: 30,
                  ),
                  color: Colors.cyan,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BlogFeed(
                              title: '',
                            )));
                  },
                  icon: const Icon(
                    FontAwesomeIcons.blog,
                    color: Colors.blueGrey,
                    size: 30,
                  ),
                  color: Colors.cyan,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
