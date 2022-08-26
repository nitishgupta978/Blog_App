import 'package:singup_app/blogs/datasource/i_blog_repository.dart';
import 'package:singup_app/blogs/datasource/models.dart';

class MockBlogRepo implements IBlogRepository {
  final List<Blog> _ds = [];
  @override
  Future<void> addBlog(Blog blog) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBlog(int id) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Blog>> fetchAllBlogs() {
    throw UnimplementedError();
  }
}
