import 'package:flutter/material.dart';

import 'blogDetailsPage.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key, required String title}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class User {
  final String urlAvatar;

  const User({required this.urlAvatar});
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Blog Page')),
        body: ListView(
          children: [
            ListTile(
                title: const Text('Technology'),
                isThreeLine: true,
                subtitle: const Text(
                    'NASA’s Webb Delivers Deepest Infrared Image of Universe Yet\nauthor name :@Nitish Gupta'),
                leading: SizedBox(
                    // height: 100.0,
                    width: 100.0, // fixed width and height
                    child: Image.asset("assets/images/BlogTech.jpg")),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_circle_right),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const BlogDetails(title: 'Sing up Page');
                    }));
                  },
                )),
            ListTile(
                title: const Text('Technology Space'),
                isThreeLine: true,
                subtitle: const Text(
                    'NASA’s Webb Delivers Deepest Infrared Image of Universe Yet\nauthor name : @John Gupta'),
                leading: SizedBox(
                    // height: 100.0,
                    width: 100.0, // fixed width and height
                    child: Image.asset("assets/images/BlogTech2.jpg")),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_circle_right),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const BlogDetails(title: 'Sing up Page');
                    }));
                  },
                )),
            ListTile(
                title: const Text('Technology App'),
                isThreeLine: true,
                subtitle: const Text(
                    'NASA’s App make easy way to solve your problems t\nauthor name : @Jai Gupta'),
                leading: SizedBox(
                    // height: 100.0,
                    width: 100.0, // fixed width and height
                    child: Image.asset("assets/images/BlogTech5.png")),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_circle_right),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const BlogDetails(title: 'Sing up Page');
                    }));
                  },
                )),
            ListTile(
                title: const Text('Technology Web'),
                isThreeLine: true,
                subtitle: const Text(
                    'NASA’sif you want become web Devloper then it good way\nauthor name : @Davindra Singh'),
                leading: SizedBox(
                    // height: 100.0,
                    width: 100.0, // fixed width and height
                    child: Image.asset("assets/images/BlogTech4.webp")),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_circle_right),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const BlogDetails(title: 'Sing up Page');
                    }));
                  },
                )),
            ListTile(
                title: const Text('Technology World'),
                isThreeLine: true,
                subtitle: const Text(
                    'NASA’s Technology make a great future \nauthor name : @Shukwant Singh'),
                leading: SizedBox(
                    // height: 100.0,
                    width: 100.0, // fixed width and height
                    child: Image.asset("assets/images/fbLogo.jpg")),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_circle_right),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const BlogDetails(title: 'Blog Feed');
                    }));
                  },
                )),
          ],
        ));
  }
}
