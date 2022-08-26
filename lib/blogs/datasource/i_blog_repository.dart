import 'package:singup_app/blogs/datasource/models.dart';

abstract class IBlogRepository {
  Stream<List<Blog>> fetchAllBlogs();
  Future<void> addBlog(Blog blog);
  Future<bool> deleteBlog(int id);
}
