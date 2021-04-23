import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_feed/models/article_model.dart';
import 'home.dart';
import 'category_news.dart';
import 'views/article_view.dart';


List<ArticleModel> favoriteArticles = [];

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
  ));
}

class MyApp extends StatelessWidget {

  final String title = "NewsFeed";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
      // home: MyStatefulWidget(),
    );
  }
}
