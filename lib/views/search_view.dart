import 'package:flutter/material.dart';
import 'package:news_feed/views/article_view.dart';
import 'package:news_feed/helper/news.dart';
import 'package:news_feed/home.dart';
import 'package:news_feed/models/article_model.dart';
import 'package:news_feed/widgets/blog_tile.dart';

class SearchView extends StatefulWidget {

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  List<ArticleModel> articles = [];

  final myController = TextEditingController();
  bool _loading = true;

  getNews(String q) async{
    SearchNews news = SearchNews();
    await news.getNews(q);
    articles = news.news;
    setState(() {
      _loading = false;
    });
    print(articles.length);
    print(_loading);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                child: Container(
                  child: TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Query',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: 50,
                child: IconButton(
                  icon: Icon(Icons.search_rounded),
                  onPressed: () {
                    getNews(myController.text);
                    print("Pressed");
                  },
                ),
              ),
            ),
          ],
        ),
          _loading == true ? Container() :
          Expanded(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: articles.length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index){
                  return BlogTile(
                    article: articles[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
