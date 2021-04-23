import 'package:flutter/material.dart';
import 'package:news_feed/article_view.dart';
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
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: <Widget> [
              Text("News"),
              Text("Feed", style: TextStyle(
                  color: Colors.blue
                ),
              ),
            ],
          )
      ),
      body: Container(
        child: Column(
          children: [
            Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  child: TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Query',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      getNews(myController.text);
                      print("Pressed");
                    },
                    child: Text('Submit'),
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
                      imgUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      desc: articles[index].description,
                      content: articles[index].content,
                      posturl: articles[index].articleUrl,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
