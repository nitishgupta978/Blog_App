import 'package:flutter_test/flutter_test.dart';
import 'package:singup_app/blogs/datasource/models.dart';

import 'mocks/mock_blog_repo.dart';

void main() {
  group("Blog Repository test", () {
    final blogRepo = MockBlogRepo();

    test('stream test', () {
      final blog = Blog(
        id: 1,
        title: "title",
        content: "content",
        imageUrl: "imageUrl",
        author: const Author(email: 'email', photoUrl: 'photoUrl'),
        updatedAt: DateTime(2022),
      );

      blogRepo.addBlog(blog);
      expectLater(
          blogRepo.fetchAllBlogs(),
          emitsInOrder([
            [blog],
          ]));
      final blog2 = blog.copyWith(id: 2);
      blogRepo.addBlog(blog2);
      expectLater(
          blogRepo.fetchAllBlogs(),
          emitsInOrder([
            [blog],
            [blog, blog2]
          ]));
      blogRepo.deleteBlog(1);
      expectLater(
          blogRepo.fetchAllBlogs(),
          emitsInOrder([
            [blog],
            [blog, blog2],
            [blog2]
          ]));
    });
  });
}
