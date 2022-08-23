import 'package:singup_app/blogs/datasource/blog_repository.dart';
import 'package:singup_app/blogs/datasource/models.dart';
import 'package:singup_app/common/observable/observable.dart';

class BlogFeedBloc {
  late final Observable<List<Blog>> blogs;
  late final Observable<bool> isLoading;

  BlogFeedBloc() {
    blogs = Observable.seeded(<Blog>[]);
    isLoading = Observable.seeded(false);
    BlogRepository().fetchAllBlogs().listen((event) {
      blogs.addValue(event);
    });
  }

  Future<void> deleteBlog(int id) async {
    await BlogRepository().deleteBlog(id);
  }

  void dispose() {
    blogs.dispose();
    isLoading.dispose();
  }
}
