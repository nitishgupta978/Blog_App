import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:singup_app/blogs/logic_blog/blog_feed_bloc.dart';
import 'package:singup_app/blogs/screens/add_blog.dart';
import 'package:singup_app/blogs/screens/blog_details.dart';
import 'package:singup_app/di.dart';

final _blocProvider = Provider<BlogFeedBloc>((ref) {
  return BlogFeedBloc(ref.watch(blogRepoProvider));
});
final _blogFeedProvider =
    StreamProvider((ref) => ref.watch(_blocProvider).blogs.obs$);

class BlogFeed extends ConsumerWidget {
  const BlogFeed({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(_blocProvider);

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
      body: ref.watch(_blogFeedProvider).when(
            data: (blogs) => ListView.builder(
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
            ),
            error: (err, _) => Center(
              child: Text(
                '$err',
                style: const TextStyle(color: Colors.red),
              ),
            ),
            loading: () => const CircularProgressIndicator(),
          ),
    );
  }
}
