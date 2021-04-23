import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/helper/data.dart';
import 'package:news_feed/helper/news.dart';
import 'package:news_feed/models/article_model.dart';
import 'package:news_feed/models/category_model.dart';
import 'package:news_feed/widgets/blog_tile.dart';
import 'package:news_feed/widgets/category_tile.dart';


// class Articles extends StatefulWidget {
//   @override
//   _ArticlesState createState() => _ArticlesState();
// }
//
// class _ArticlesState extends State<Articles> {
//
//   List<CategoryModel> categories = [];
//   List<ArticleModel> articles = [];
//
//   bool _loading = true;
//
//   @override
//   void initState(){
//     super.initState();
//     categories = getCategories();
//     getNews();
//   }
//
//   getNews() async{
//     News news = News();
//     await news.getNews();
//     articles = news.news;
//     setState(() {
//       _loading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _loading ? ArticlesLoading() :
//     ArticleList(categories: categories, articles: articles);
//   }
// }


class Articles extends StatelessWidget {
  final List<ArticleModel> articles;
  final bool loading;

  Articles({this.loading, this.articles});


  @override
  Widget build(BuildContext context) {
    return loading ? ArticlesLoading() :
    ArticleList(articles: articles);
  }
}



class ArticlesLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ArticleList extends StatelessWidget {

  final List<CategoryModel> categories = getCategories();
  final List<ArticleModel> articles;

  ArticleList({this.articles});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
            child: Column(
              children: <Widget>[

                //Categories
                Container(
                    height: 70,
                    child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return CategoryTile(
                          categories[index].imageUrl,
                          categories[index].categoryName,
                        );
                      },
                    )
                ),

                //Blogs
                Container(
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
                    )
                ),
              ],
            )
        ),
      ),
    );
  }
}
