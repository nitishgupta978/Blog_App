import 'package:flutter/material.dart';
import 'package:singup_app/blogs/datasource/blog_repository.dart';
import 'package:singup_app/blogs/datasource/models.dart';
import 'package:singup_app/common/widgets/input_field.dart';
import 'package:singup_app/common/widgets/vertical_spacing.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({Key? key, required String title}) : super(key: key);

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
        author: const Author(email: 'nitish@spice.com', photoUrl: ""),
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
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  labelText: 'Title',
                ),
              ),
              const VerticalSpacing(),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  labelText: 'Title',
                ),
              ),
              const VerticalSpacing(),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  labelText: 'Title',
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
