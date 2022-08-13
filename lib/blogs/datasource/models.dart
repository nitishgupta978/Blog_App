import 'blog_repository.dart';

class BlogRepository {
  static BlogRepository? _instance;
  BlogRepository._(); // Private Constructor
  factory BlogRepository() {
    _instance ??= BlogRepository._(); // ??= is called Elvis Operator
    return _instance!;
  }

  final List<Blog> _blogs = <Blog>[];

  Future<List<Blog>> fetchAllBlogs() async {
    await Future.delayed(const Duration(seconds: 2)); // Thread.sleep
    return _blogs;
  }

  Future<void> addBlog(Blog blog) async {
    await Future.delayed(const Duration(seconds: 2));
    _blogs.add(blog);
  }
}
