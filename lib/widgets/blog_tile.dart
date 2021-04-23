import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/models/article_model.dart';

import '../views/article_view.dart';

class BlogTile extends StatelessWidget {
  final ArticleModel article;

  BlogTile({this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
                blogUrl: article.url
            )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        article.urlToImage,
                        height: 200,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 12,),
                  Text(
                    article.title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    article.description,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}