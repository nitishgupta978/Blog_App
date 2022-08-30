import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:singup_app/auth/logic/sign_in_bloc.dart';

import 'package:singup_app/auth/screens/sign_up_page.dart';
import 'package:singup_app/back_ground_logo.dart';
import 'package:singup_app/blogs/screens/blogs.dart';
import 'package:singup_app/common/widgets/input_field.dart';
import 'package:singup_app/common/widgets/vertical_spacing.dart';
import 'package:singup_app/di.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../back_ground_logo.dart';

final _blocProvider =
    Provider((ref) => SignInBloc(ref.watch(authRepoProvider)));

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(_blocProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 450,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const BackGroundLogo(),
                  const HeightBox(10),
                  //
                  const VerticalSpacing(),
                  const EmailInputWidget(), // only rebuild EmailInputWidget , SignInSubmitButton, and PasswordInputWidget
                  //
                  const SizedBox(
                    height: 15.0,
                  ),
                  //
                  const VerticalSpacing(),
                  const PasswordInputWidget(),
                  //
                  const SizedBox(
                    height: 10.0,
                  ),
                  //
                  const VerticalSpacing(),
                  const SignInSubmitButton(),
                  //
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
                                        builder: (context) =>
                                            const SingUpPage()),
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

class SignInSubmitButton extends ConsumerWidget {
  const SignInSubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(_blocProvider);
    return StreamBuilder<bool>(
        stream: bloc.validInputObs$,
        builder: (context, snapshot) {
          final isValid = snapshot.data ?? false;
          return ElevatedButton.icon(
            key: const ValueKey('login_submit_button'),
            onPressed: isValid
                ? () async {
                    if (await bloc.signIn()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const BlogFeed(
                                title: '',
                              )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User not found')),
                      );
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(15.0),
            ),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Sign In'),
          );
        });
  }
}

class PasswordInputWidget extends ConsumerWidget {
  const PasswordInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(_blocProvider);
    return StreamBuilder(
        stream: bloc.password.obs$,
        builder: (context, snapshot) {
          return StreamBuilder<bool>(
              stream: bloc.passwordObscure.obs$,
              initialData: true,
              builder: (context, obscureSnap) {
                return InputField(
                  key: const ValueKey('password_input_fields'),
                  onChanged: bloc.password.addValue,
                  suffixIcon: InkWell(
                    onTap: () {
                      bloc.passwordObscure.addValue(!obscureSnap.data!);
                    },
                    // customBorder: const OutlineInputBorder(
                    //     borderRadius: BorderRadius.all(
                    //         Radius.circular(15.0))),
                    child: !obscureSnap.data!
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  obscureText: obscureSnap.data,
                  errorText: snapshot.error as String?,
                  hintText: 'eg. qasA012@fd',
                  labelText: 'Password',
                );
              });
        });
  }
}

class EmailInputWidget extends ConsumerWidget {
  const EmailInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(_blocProvider);
    return StreamBuilder<String?>(
      key: const ValueKey('email_input_field_builder'),
      stream: bloc.email.obs$,
      builder: (context, snapshot) {
        return InputField(
          onChanged: bloc.email.addValue,
          hintText: 'eg. abc@gmail.com',
          labelText: 'Email ID',
          errorText: snapshot.error as String?,
        );
      },
    );
  }
}
