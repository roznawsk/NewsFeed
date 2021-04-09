import 'package:flutter/material.dart';
import 'home.dart';
import 'category_news.dart';
import 'article_view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final String title = "Example";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}

