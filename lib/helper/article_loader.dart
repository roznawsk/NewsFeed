
import 'package:flutter/cupertino.dart';
import 'package:news_feed/models/article_model.dart';

import 'data.dart';
import 'news.dart';

class ArticleLoader extends StatefulWidget {
  @override
  _ArticleLoaderState createState() => _ArticleLoaderState();
}

class _ArticleLoaderState extends State<ArticleLoader> {

  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState(){
    super.initState();
    _loadNews();
  }

  _loadNews() async{
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
