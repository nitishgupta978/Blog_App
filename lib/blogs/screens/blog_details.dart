import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:singup_app/blogs/screens/delete_blogs.dart';
import 'package:singup_app/blogs/datasource/models.dart';
import 'package:singup_app/common/widgets/vertical_spacing.dart';

class BlogDetails extends StatelessWidget {
  final Blog blog;
  const BlogDetails({Key? key, required this.blog, required String title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          blog.title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    // await _editItem(item);
                  },
                  icon: const Icon(Icons.edit),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () async {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const DeleteBlogs(
                              // title: '',
                              ),
                        ),
                        (route) => false);
                  },
                  icon: const Icon(Icons.delete_forever),
                  color: Colors.black,
                ),
                Text(blog.updatedAt.toString()),
                const SizedBox(
                  width: 48,
                ),
                Text('by ${blog.author.email}')
              ],
            ),
            const VerticalSpacing(),
            Image.network(blog.imageUrl),
            const VerticalSpacing(),
            Html(
              data: blog.content,
            ),
          ],
        ),
      ),
    );
  }
}
