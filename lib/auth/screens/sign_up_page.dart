import 'package:flutter/material.dart';
import 'package:singup_app/auth/datasource/auth_repository.dart';
import 'package:singup_app/auth/logic/validators.dart';
import 'package:singup_app/back_ground_logo.dart';
import 'package:singup_app/common/widgets/vertical_spacing.dart';
import 'package:velocity_x/velocity_x.dart';

import 'login_page.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final AuthRepository repo = AuthRepository();
  final GlobalKey<FormState> formKey =
      GlobalKey(); //use for validation perpuse in SingUpPage
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  // final TextEditingController samepasswordController = TextEditingController();
  bool showPassword = false;

  Future<void> signUp() async {
    final isSuccess = await repo.signUp(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      // samePassword: samepasswordController.text,
    );

    if (mounted) {
      if (isSuccess) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const LoginPage(
                  title: '',
                )));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Some error occured!")));
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    // samepasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Signup Page')),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 450,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const BackGroundLogo(),
                    const HeightBox(5),
                    const VerticalSpacing(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _firstNameController,
                        validator: (value) {
                          return value?.validateAsName();
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white60,
                          label: Text('First Name'),
                          hintText: "eg. John",
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
                        controller: _lastNameController,
                        validator: (value) {
                          return value?.validateAsName();
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white60,
                          label: Text('Last Name'),
                          hintText: "eg. wick",
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
                        obscureText: true, //for hide password
                        // controller: samepasswordController,
                        validator: (value) {
                          return value?.validateAsPassword();
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
                    const VerticalSpacing(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: !showPassword, //for hide password
                        validator: (value) {
                          return value?.validateSameAsPassword(
                              _passwordController.text);
                        },

                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            child: showPassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onTap: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Colors.white60,
                          label: const Text('re-enter password'),
                          hintText: "********",
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          signUp();
                        }
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
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan)),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
