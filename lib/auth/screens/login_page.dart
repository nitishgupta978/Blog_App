import 'package:flutter/material.dart';
import 'package:singup_app/auth/logic/validators.dart';
import 'package:singup_app/back_ground_logo.dart';
import 'package:singup_app/blogs/screens/blog_details.dart';
import 'package:singup_app/common/widgets/vertical_spacing.dart';
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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool showPassword = false;

  Future<void> login() async {
    if (_emailController.text == "nitish@spice.com" &&
        _passwordController.text == "Nitish@789") {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const BlogFeed(
                title: '',
              )));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('User not found')));
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
      body: SingleChildScrollView(
        child: Center(
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
                    // keyboardType: TextInputType.text,
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
                    validator: (value) {
                      return value.validateAsPassword();
                    },
                    // keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
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
                    login();
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


// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//           vertical: 48.0,
//           horizontal: MediaQuery.of(context).size.width / 6,
//         ),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               const Text(
//                 'Sign In to Spice Blog',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const VerticalSpacing(),
//               InputField(
//                 controller: _emailController,
//                 validator: (value) {
//                   return value.validateAsEmail();
//                 },
//                 hintText: 'for e.g., abc@xyz.com',
//                 labelText: 'Email ID',
                
//               ),
//               const VerticalSpacing(),
//               InputField(
//                 controller: _passwordController,
//                 validator: (value) {
//                   return value.validateAsPassword();
//                 },
//                 suffixIcon: InkWell(
//                   child: _showPassword
//                       ? const Icon(Icons.visibility_off)
//                       : const Icon(Icons.visibility),
//                   onTap: () {
//                     setState(() {
//                       _showPassword = !_showPassword;
//                     });
//                   },
//                 ),
//                 obscureText: !_showPassword,
//                 hintText:
//                     'Must have at least one uppercase letter, one lowercase letter and one number',
//                 labelText: 'Password',
//               ),
//               const VerticalSpacing(),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     login();
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                         content: Text('Please check the inputs')));
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(16.0),
//                 ),
//                 icon: const Icon(Icons.login),
//                 label: const Text('Sign In'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
