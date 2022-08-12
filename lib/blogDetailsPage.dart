import 'package:flutter/material.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("BlogDetailsPage"),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/BlogTech.jpg"),
                  const Text(
                    'Baruch graduated from City College of New York in 1889, and his first job was as an office boy earning  a week. He ran errands in the banking and financial district and became enamored of the potential\n Wall Street held. He became a runner for a brokerage house and invested all his effort and time in learning the business, eventually becoming a broker and then a partner in the firm of A. A. Housman and Company. His earnings and commissions afforded him the opportunity to buy a seat on the New York Stock Exchange, and by the time he was 30 years old, he had become a millionaire.',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            )));
  }
}
