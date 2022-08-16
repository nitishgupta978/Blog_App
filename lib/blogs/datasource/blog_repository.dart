import 'dart:convert';
import 'dart:developer';

import 'package:singup_app/blogs/datasource/models.dart';
import 'package:singup_app/common/network_client/network_client.dart';

class BlogRepository {
  static BlogRepository? _instance;
  BlogRepository._(); // Private Constructor
  factory BlogRepository() {
    _instance ??= BlogRepository._(); // ??= is called Elvis Operator
    return _instance!;
  }

  // ignore: unused_field
  final List<Blog> _blogs = <Blog>[];

  Future<List<Blog>> fetchAllBlogs() async {
    final res = await NetworkClient.get('fetchAllBlogs');
    try {
      final data = json.decode(res.body);
      return data.map<Blog>((e) => Blog.fromJson(e)).toList();
    } catch (_) {
      return <Blog>[];
    }
  }

  Future<void> addBlog(Blog blog) async {
    final res = await NetworkClient.post('addBlog', data: blog.toJson());
    log(res.body);
  }
}
