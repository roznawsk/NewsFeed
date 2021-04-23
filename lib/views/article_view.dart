import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_feed/models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:news_feed/main.dart';


class ArticleView extends StatefulWidget {

  final ArticleModel article;

  ArticleView({this.article});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget> [
            Text("News"),
            Text("Feed", style: TextStyle(
                color: Colors.blue
            ),),
          ],
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  // favoriteArticles.add();
                },
                child: Icon(
                    Icons.favorite
                ),
              )
          ),
        ],
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.article.url,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        )
      ),
    );
  }
}
