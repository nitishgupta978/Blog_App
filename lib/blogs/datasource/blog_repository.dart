class Blog {
  final String title;
  final String content;
  final String imageUrl;
  final Author author;
  final String updateOn;

  const Blog({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.updateOn,
  });
}

class Author {
  final String email;
  final String photoUrl;

  const Author({
    required this.email,
    required this.photoUrl,
  });
}
