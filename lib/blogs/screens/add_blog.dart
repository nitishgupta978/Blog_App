import 'package:flutter/material.dart';
import 'package:singup_app/auth/datasource/auth_repository.dart';
import 'package:singup_app/back_ground_logo.dart';
import 'package:singup_app/blogs/datasource/blog_repository.dart';
import 'package:singup_app/blogs/datasource/models.dart';
import 'package:singup_app/common/widgets/vertical_spacing.dart';
import 'package:velocity_x/velocity_x.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({Key? key, required String title}) : super(key: key);

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  final BlogRepository repo = BlogRepository();
  final AuthRepository _authRepo = AuthRepository();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  bool _isLoading = false;

  Future<void> addBlog() async {
    if (_titleController.text.length >= 5) {
      final blog = Blog(
        title: _titleController.text,
        content: _contentController.text,
        imageUrl: _imageController.text,
        author: Author(email: _authRepo.currentUser!.email, photoUrl: ""),
        updatedAt: DateTime.now(),
      );

      setState(() {
        _isLoading = true;
      });
      _titleController.clear();
      _contentController.clear();
      _imageController.clear();
      await repo.addBlog(blog);
      setState(() {
        _isLoading = false;
      });
    }
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white60,
                  label: Text('Titel'),
                  hintText: 'eg. Beauty of nature',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const VerticalSpacing(),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white60,
                  label: Text('context'),
                  hintText: 'eg. Write your Blog details ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const VerticalSpacing(),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white60,
                  label: Text('ImageUrl'),
                  hintText:
                      "eg. https://thumbs.dreamstime.com/b/climate-change-concept-image-landscape-green-grass-drought-land-extreme-dry-woman-walking-field-50990297.jpg",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
              const VerticalSpacing(),
              ElevatedButton(
                  onPressed: _isLoading ? null : addBlog,
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const Text('Add Blog'))
            ],
          ),
        ),
      ),
    );
  }
}
