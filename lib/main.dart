import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:singup_app/auth/screens/login_page.dart';
import 'package:singup_app/blogs/screens/blogs.dart';
import 'package:singup_app/di.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepo = ref.watch(authRepoProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blog App',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: authRepo.currentUser == null
            ? const LoginPage(
                title: '',
              )
            : const BlogFeed(title: ''));
  }
}
