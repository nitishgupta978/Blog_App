import 'dart:convert';
import 'dart:developer';

import 'package:singup_app/blogs/datasource/models.dart';
import 'package:singup_app/common/network_client/network_client.dart';

import 'package:web_socket_channel/web_socket_channel.dart';

class BlogRepository {
  static BlogRepository? _instance;
  WebSocketChannel? _channel;

  BlogRepository._(); // Private Constructor
  factory BlogRepository() {
    _instance ??= BlogRepository._(); // ??= is called Elvis Operator

    _instance!._channel ??= WebSocketChannel.connect(
        Uri.parse('wss://spiceblogserver-production.up.railway.app/ws'));
    return _instance!;
  }

  Stream<List<Blog>> fetchAllBlogs() async* {
    yield* _instance!._channel!.stream.map((event) {
      //final res = await NetworkClient.get('fetchAllBlogs');
      try {
        final data = json.decode(event);
        return data.map<Blog>((e) => Blog.fromJson(e)).toList();
      } catch (_) {
        return <Blog>[];
      }
    });
  }

  Future<void> addBlog(Blog blog) async {
    final res = await NetworkClient.post('addBlog', data: blog.toJson());
    log(res.body);
  }

  Future<bool> deleteBlog(int id) async {
    final res = await NetworkClient.delete('deleteBlog?id=$id');
    return res.statusCode == 200;
  }
}
