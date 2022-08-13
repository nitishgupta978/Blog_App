import 'package:flutter/material.dart';
import 'package:singup_app/blogs/datasource/blog_repository.dart';
import 'package:singup_app/blogs/datasource/models.dart';
import 'package:singup_app/blogs/screens/blogs.dart';

import '../../blogDetailsPage.dart';

class BlogFeed extends StatefulWidget {
  const BlogFeed({Key? key, required String title}) : super(key: key);

  @override
  State<BlogFeed> createState() => _BlogFeedState();
}

class _BlogFeedState extends State<BlogFeed> {
  final BlogRepository repo = BlogRepository();

  List<Blog> _blogs = [];
  bool _isLoading = false;

  Future<void> fetchAllBlogs() async {
    setState(() {
      _isLoading = true;
    });
    final List<Blog> blogs = await repo.fetchAllBlogs();
    setState(() {
      _blogs = blogs;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAllBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blog Page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddBlogPage()));
          fetchAllBlogs();
        },
        child: const Icon(Icons.add),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlogDetails(
                        blog: _blogs[index],
                        title: '',
                      ),
                    ),
                  );
                },
                title: Text(_blogs[index].title),
              ),
              itemCount: _blogs.length,
            ),
    );
  }
}
