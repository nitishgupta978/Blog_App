import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:singup_app/back_ground_logo.dart';
import 'package:singup_app/blogs/logic_blog/add_blog_bloc.dart';
import 'package:singup_app/common/widgets/input_field.dart';
import 'package:singup_app/common/widgets/vertical_spacing.dart';
import 'package:singup_app/di.dart';
import 'package:velocity_x/velocity_x.dart';

final blocProvider = Provider.autoDispose((ref) =>
    AddBlogBloc(ref.watch(blogRepoProvider), ref.watch(authRepoProvider)));

class AddBlogPage extends ConsumerWidget {
  const AddBlogPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(blocProvider);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 30.0,
            horizontal: MediaQuery.of(context).size.width / 6,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BackGroundLogo(),
              const HeightBox(20),
              const VerticalSpacing(),

              StreamedInputField(
                addValue: bloc.title.addValue,
                title: 'Title',
                stream: bloc.title.obs$,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const VerticalSpacing(),
              StreamedInputField(
                addValue: bloc.content.addValue,
                title: 'Content',
                stream: bloc.content.obs$,
              ),
              //
              const VerticalSpacing(),
              StreamedInputField(
                addValue: bloc.imgUrl.addValue,
                title: 'Image Url',
                stream: bloc.imgUrl.obs$,
              ),
              const SizedBox(
                height: 10.0,
              ),
              //
              // const VerticalSpacing(),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     filled: true,
              //     fillColor: Colors.white60,
              //     label: Text('ImageUrl'),
              //     hintText:
              //         "eg. https://thumbs.dreamstime.com/b/climate-change-concept-image-landscape-green-grass-drought-land-extreme-dry-woman-walking-field-50990297.jpg",
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(10.0))),
              //   ),
              // ),
              const VerticalSpacing(),
              StreamBuilder<bool>(
                stream: bloc.validInputObs$,
                builder: (context, snapshot) {
                  final isValid = snapshot.data ?? false;
                  return StreamBuilder<bool>(
                    stream: bloc.isLoading.obs$,
                    builder: (context, loadingSnapshot) {
                      final isLoading = loadingSnapshot.data ?? false;
                      return ElevatedButton(
                          onPressed: isLoading || !isValid
                              ? null
                              : () async {
                                  bloc.isLoading.addValue(true);
                                  bloc.addBlog();
                                  bloc.isLoading.addValue(false);
                                  Navigator.of(context).pop();
                                },
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : const Text('Add Blog'));
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StreamedInputField<T> extends StatelessWidget {
  final Stream<T> stream;
  final void Function(String?) addValue;
  final String title;

  const StreamedInputField({
    Key? key,
    // required void Function(String? value) addValue,
    // required String title,
    // required Stream<String?> stream,
    required this.stream,
    required this.addValue,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, snapshot) {
        return InputField(
          // onChanged: addValue,
          // decoration: const InputDecoration(
          //   filled: true,
          //   fillColor: Colors.white60,
          //   label: Text('Titel'),
          //   hintText: 'eg. Beauty of nature',
          //   border: OutlineInputBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(10.0))),
          // ),
          onChanged: addValue,
          hintText: title,
          labelText: title,
          errorText: snapshot.error as String?,
        );
      },
    );
  }
}
