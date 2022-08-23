import 'package:flutter/material.dart';

import 'package:singup_app/blogs/datasource/models.dart';
import 'package:singup_app/blogs/logic_blog/blog_feed_bloc.dart';
import 'package:singup_app/blogs/screens/add_blog.dart';
import 'package:singup_app/blogs/screens/blog_details.dart';

class BlogFeed extends StatefulWidget {
  const BlogFeed({Key? key, required String title}) : super(key: key);

  @override
  State<BlogFeed> createState() => _BlogFeedState();
}

class _BlogFeedState extends State<BlogFeed> {
  late final BlogFeedBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlogFeedBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
  // final BlogRepository repo = BlogRepository();

  // List<Blog> _blogs = [];
  // bool _isLoading = false;

  // Future<void> fetchAllBlogs() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   final List<Blog> blogs = repo.fetchAllBlogs() as List<Blog>;
  //   setState(() {
  //     _blogs = blogs;
  //     _isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // fetchAllBlogs();
  // }

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
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Blog>>(
          stream: bloc.blogs.obs$,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            final blogs = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                final blog = blogs[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlogDetails(
                          blog: blog,
                          title: '',
                        ),
                      ),
                    );
                  },
                  trailing: IconButton(
                      onPressed: () => bloc.deleteBlog(blog.id!),
                      icon: const Icon(Icons.delete)),
                  leading: Image.network(
                    blog.imageUrl,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(blog.title),
                  subtitle: Text('by ${blog.author.email}'),
                );
              },
              itemCount: blogs.length,
            );
          }),
    );
  }
}
