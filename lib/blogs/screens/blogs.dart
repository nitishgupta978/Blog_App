import 'package:flutter/material.dart';
import 'package:singup_app/blogs/datasource/blog_repository.dart';
import 'package:singup_app/blogs/datasource/models.dart';
import 'package:singup_app/blogs/screens/add_blog.dart';
import 'package:singup_app/blogs/screens/blog_details.dart';

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
      appBar: AppBar(title: const Text('All Blogs')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddBlogPage(
                    title: '',
                  )));
          fetchAllBlogs();
        },
        child: const Icon(Icons.add),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Center(
                          child: BlogDetails(
                            blog: _blogs[index],
                            title: '',
                          ),
                        ),
                      ),
                    );
                  },
                  leading: Image.network(_blogs[index].imageUrl),
                  title: Text(_blogs[index].title),
                ),
              ),
              itemCount: _blogs.length,
            ),
    );
  }
}
