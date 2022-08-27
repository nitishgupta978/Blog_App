import 'package:flutter_test/flutter_test.dart';
import 'package:singup_app/blogs/datasource/models.dart';

import 'mocks/mock_blog_repo.dart';

void main() {
  group("Blog Repository test", () {
    final blogRepo = MockBlogRepo();

    test('stream test', () {
      blogRepo.addBlog(Blog(
        title: "title",
        content: "content",
        imageUrl: "imageUrl",
        author: const Author(email: 'email', photoUrl: 'photoUrl'),
        updatedAt: DateTime(2022),
      ));
      expectLater(blogRepo.fetchAllBlogs(), emitsInOrder([]));
      blogRepo.addBlog(Blog(
        title: "title",
        content: "content",
        imageUrl: "imageUrl",
        author: const Author(email: 'email', photoUrl: 'photoUrl'),
        updatedAt: DateTime(2022),
      ));
      expectLater(
          blogRepo.fetchAllBlogs(),
          emitsInOrder([
            [
              Blog(
                  title: "title",
                  content: "content",
                  imageUrl: "imageUrl",
                  author: const Author(email: 'email', photoUrl: 'photoUrl'),
                  updatedAt: DateTime(2022))
            ],
            [
              Blog(
                  title: "title",
                  content: "content",
                  imageUrl: "imageUrl",
                  author: const Author(email: 'email', photoUrl: 'photoUrl'),
                  updatedAt: DateTime(2022)),
              Blog(
                  title: "title",
                  content: "content",
                  imageUrl: "imageUrl",
                  author: const Author(email: 'email', photoUrl: 'photoUrl'),
                  updatedAt: DateTime(2022))
            ],
          ]));
    });
  });
}
