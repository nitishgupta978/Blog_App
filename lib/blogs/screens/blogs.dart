import 'package:flutter/material.dart';
import 'package:singup_app/blogs/datasource/models.dart';
import 'package:singup_app/common/widgets/vertical_spacing.dart';

import '../datasource/blog_repository.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({Key? key}) : super(key: key);

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  final BlogRepository repo = BlogRepository();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  bool _isLoading = false;

  Future<void> addBlog() async {
    if (_titleController.text.length >= 10) {
      final blog = Blog(
        title: _titleController.text,
        content: _contentController.text,
        imageUrl: _imageController.text,
        author: const Author(email: 'jai@spice.com', photoUrl: ""),
        updateOn: "12-Aug-2022",
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

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
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
            vertical: 48.0,
            horizontal: MediaQuery.of(context).size.width / 6,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const VerticalSpacing(),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white60,
                  label: Text('context'),
                  hintText: 'Write your Blog details ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
              const VerticalSpacing(),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white60,
                  label: Text('ImageUrl'),
                  hintText:
                      "https://thumbs.dreamstime.com/b/climate-change-concept-image-landscape-green-grass-drought-land-extreme-dry-woman-walking-field-50990297.jpg",
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
