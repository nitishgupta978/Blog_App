import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:singup_app/auth/datasource/i_auth_repository.dart';
import 'package:singup_app/blogs/datasource/i_blog_repository.dart';
import 'package:singup_app/blogs/datasource/models.dart';
import 'package:singup_app/blogs/logic_blog/validators.dart';
import 'package:singup_app/common/observable/observable.dart';

class AddBlogBloc with Validators {
  final IBlogRepository _blogRepository;
  final IAuthRepository _authRepository;
  late final Observable<String?> title = Observable(validator: titleValidator);
  late final Observable<String?> imgUrl =
      Observable(validator: imgUrlValidator);
  late final Observable<String?> content =
      Observable(validator: contentValidator);

  late final Observable<bool> isLoading = Observable.seeded(false);

  AddBlogBloc(this._blogRepository, this._authRepository);

  Stream<bool> get validInputObs$ => Rx.combineLatest(
      [title.obs$, imgUrl.obs$, content.obs$], (values) => true);

  Future<void> addBlog() async {
    await _blogRepository.addBlog(Blog(
      title: title.value!,
      content: content.value!,
      imageUrl: imgUrl.value!,
      author: Author(email: _authRepository.currentUser!.email, photoUrl: ""),
      updatedAt: DateTime.now(),
    ));
  }

  void dispose() {
    title.dispose();
    imgUrl.dispose();
    content.dispose();
  }
}
