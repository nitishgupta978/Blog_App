import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:singup_app/blogs/datasource/models.dart';

void main() {
  group('Blog test', () {
    test('quality test', () {
      final blog = Blog(
        title: "title",
        content: "content",
        imageUrl: "imageUrl",
        author: const Author(email: 'email', photoUrl: 'photoUrl'),
        updatedAt: DateTime(2022),
      );
      final blog2 = Blog(
        title: "title",
        content: "content",
        imageUrl: "imageUrl",
        author: const Author(email: 'email', photoUrl: 'photoUrl'),
        updatedAt: DateTime(2022), //DataTime should be current
      );
      final blog3 = Blog(
        title: "title",
        content: "content",
        imageUrl: "imageUrl",
        author: const Author(email: 'email', photoUrl: 'photoUrl'),
        updatedAt: DateTime(2022), //DataTime should be current
      );
      expect(blog, blog2);
      expect(blog2, blog3);
      expect(blog3, blog);
    });
    test('.formJson Test ', () {
      //line no 28 in blog class
      const jsonStr = '''
{
  "id":123,
     
        "title": "title",
        "content": "content",
        "imageurl": "imageurl",
        "email":"email",
        "updatedat":"2022-08-27T08:34:39Z"
}
''';
      final json = jsonDecode(jsonStr);
      final blog = Blog.fromJson(json);
      expect(blog.author.email, "email");
      expect(blog.author.photoUrl, "");
      expect(blog.author, const Author(email: "email", photoUrl: ""));
    });
  });
}
