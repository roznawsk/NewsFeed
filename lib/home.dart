import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/article_view.dart';
import 'package:news_feed/category_news.dart';
import 'package:news_feed/helper/data.dart';
import 'package:news_feed/models/article_model.dart';
import 'package:news_feed/models/category_model.dart';
import 'package:news_feed/search_view.dart';
import 'package:news_feed/widgets/blog_tile.dart';
import 'package:news_feed/widgets/category_tile.dart';

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


/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}