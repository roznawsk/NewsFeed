import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/article_view.dart';
import 'package:news_feed/category_news.dart';
import 'package:news_feed/helper/data.dart';
import 'package:news_feed/models/article_model.dart';
import 'package:news_feed/models/category_model.dart';
import 'package:news_feed/search_view.dart';

import 'helper/news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState(){
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async{
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
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
            ),),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SearchView()
                  )
              );
            },
            child: Icon(
              Icons.search_rounded
            )
          )
        ],
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
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

class CategoryTile extends StatelessWidget {

  final imageUrl, categoryName;
  CategoryTile(this.imageUrl, this.categoryName);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryView(
              category: categoryName.toLowerCase()
            )
          )
        );
      },
      child: Container(
        child: Stack(
          children: <Widget> [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child:Image.network(imageUrl, width: 120, height: 60, fit: BoxFit.cover)
            ),
            Center(
              child: Container(
                child: Text(categoryName, style: TextStyle(
                  color: Colors.white
                ))
              ),
            )
          ]
        )
      ),
    );
  }
}


class BlogTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  BlogTile(
      {this.imgUrl, this.desc, this.title, this.content, @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              blogUrl: posturl
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
                        imgUrl,
                        height: 200,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 12,),
                  Text(
                    title,
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
                    desc,
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