import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:singup_app/auth/logic/sign_up_bloc.dart';

import 'package:singup_app/back_ground_logo.dart';
import 'package:singup_app/common/widgets/input_field.dart';
import 'package:singup_app/common/widgets/vertical_spacing.dart';
import 'package:singup_app/di.dart';
import 'package:velocity_x/velocity_x.dart';

import 'login_page.dart';

final blocProvider = Provider((ref) => SignUpBloc(ref.watch(authRepoProvider)));

class SingUpPage extends ConsumerWidget {
  const SingUpPage({Key? key}) : super(key: key);

  Future<void> signUp(
      Future<bool> Function() signUpFn, BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final isSuccess = await signUpFn();
    if (isSuccess) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const LoginPage(title: '')));
    } else {
      messenger
          .showSnackBar(const SnackBar(content: Text("Some error occured!")));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(blocProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('Signup Page')),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 450,
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const BackGroundLogo(),
                    const HeightBox(5),
                    const VerticalSpacing(),
                    StreamBuilder<String?>(
                        stream: bloc.firstName.obs$,
                        builder: (context, snapshot) {
                          return InputField(
                            onChanged: bloc.firstName.addValue,
                            labelText: 'First Name',
                            errorText: snapshot.error as String?,
                          );
                        }),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const VerticalSpacing(),
                    StreamBuilder<String?>(
                        stream: bloc.lastName.obs$,
                        builder: (context, snapshot) {
                          return InputField(
                            onChanged: bloc.lastName.addValue,
                            labelText: 'Last Name',
                            errorText: snapshot.error as String?,
                          );
                        }),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const VerticalSpacing(),
                    StreamBuilder<String?>(
                        stream: bloc.email.obs$,
                        builder: (context, snapshot) {
                          return InputField(
                            onChanged: bloc.email.addValue,
                            hintText: 'for e.g., abc@xyz.com',
                            labelText: 'Email ID',
                            errorText: snapshot.error as String?,
                          );
                        }),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const VerticalSpacing(),
                    StreamBuilder<String?>(
                        stream: bloc.password.obs$,
                        builder: (context, snapshot) {
                          return StreamBuilder<bool>(
                              stream: bloc.passwordObscure.obs$,
                              initialData: true,
                              builder: (context, obscureSnap) {
                                return InputField(
                                  errorText: snapshot.error as String?,
                                  onChanged: bloc.password.addValue,
                                  suffixIcon: InkWell(
                                    child: !obscureSnap.data!
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                    onTap: () {
                                      bloc.passwordObscure
                                          .addValue(!obscureSnap.data!);
                                    },
                                  ),
                                  obscureText: obscureSnap.data,
                                  hintText: 'eg.adA12@bv',
                                  labelText: 'Password',
                                );
                              });
                        }),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const VerticalSpacing(),
                    StreamBuilder<String?>(
                        stream: bloc.password.obs$,
                        builder: (context, snapshot) {
                          return StreamBuilder<bool>(
                              stream: bloc.passwordObscure.obs$,
                              initialData: true,
                              builder: (context, obscureSnap) {
                                return InputField(
                                  errorText: snapshot.error as String?,
                                  onChanged: bloc.password.addValue,
                                  suffixIcon: InkWell(
                                    child: !obscureSnap.data!
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                    onTap: () {
                                      bloc.passwordObscure
                                          .addValue(!obscureSnap.data!);
                                    },
                                  ),
                                  obscureText: obscureSnap.data,
                                  hintText: 'eg.adA12@bv',
                                  labelText: 're-enter password',
                                );
                              });
                        }),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const VerticalSpacing(),
                    StreamBuilder<bool>(
                        stream: bloc.validInputObs$,
                        builder: (context, snapshot) {
                          final isValid = snapshot.data ?? false;
                          return ElevatedButton.icon(
                            onPressed: isValid
                                ? () => signUp(bloc.signUp, context)
                                : null,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                            ),
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text('Sign Up'),
                          );
                        }),
                    const VerticalSpacing(),
                    RichText(
                      text: TextSpan(
                          text: 'Already a user?',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                          children: [
                            TextSpan(
                                text: ' Sign In ',
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => const LoginPage(
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
          ),
        ));
  }
}
