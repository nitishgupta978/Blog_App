import 'package:flutter/material.dart';
import 'package:singup_app/blogs/screens/blogs.dart';

class DeleteBlogs extends StatefulWidget {
  const DeleteBlogs({Key? key}) : super(key: key);

  @override
  State<DeleteBlogs> createState() => _DeleteBlogsState();
}

class _DeleteBlogsState extends State<DeleteBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('you want to delete your blog '),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                child: const Text("Pop!"),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const BlogFeed(
                          title: '',
                        ),
                      ),
                      (route) => false);
                }),
          )
        ],
      )),
    );
  }
}
