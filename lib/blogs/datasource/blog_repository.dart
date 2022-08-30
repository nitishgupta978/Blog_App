import 'dart:convert';
import 'dart:developer';

import 'package:singup_app/blogs/datasource/i_blog_repository.dart';
import 'package:singup_app/blogs/datasource/models.dart';
import 'package:singup_app/common/network_client/network_client.dart';

import 'package:web_socket_channel/web_socket_channel.dart';

// abstract class IBlogRepository {
//   Stream<List<Blog>> fetchAllBlogs();
//   Future<void> addBlog(Blog blog);
//   Future<bool> deleteBlog(int id);
// }

class BlogRepository implements IBlogRepository {
  final INetworkClient _iNetworkClient;
  WebSocketChannel? _channel;

  BlogRepository(this._iNetworkClient) {
    _channel ??= WebSocketChannel.connect(
        Uri.parse('wss://spiceblogserver-production.up.railway.app/ws'));
  }

  @override
  Stream<List<Blog>> fetchAllBlogs() async* {
    yield* _channel!.stream.map((event) {
      //final res = await NetworkClient.get('fetchAllBlogs');
      try {
        final data = json.decode(event);
        return data.map<Blog>((e) => Blog.fromJson(e)).toList();
      } catch (_) {
        return <Blog>[];
      }
    });
  }

  @override
  Future<void> addBlog(Blog blog) async {
    final res = await NetworkClient().post('addBlog', data: blog.toJson());
    log(res.body);
  }

  @override
  Future<bool> deleteBlog(int id) async {
    final res = await NetworkClient().delete('deleteBlog?id=$id');
    return res.statusCode == 200;
  }
}
