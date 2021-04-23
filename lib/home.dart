import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/main.dart';
import 'package:news_feed/views/article_view.dart';
import 'package:news_feed/category_news.dart';
import 'package:news_feed/helper/data.dart';
import 'package:news_feed/models/article_model.dart';
import 'package:news_feed/models/category_model.dart';
import 'package:news_feed/views/search_view.dart';
import 'package:news_feed/widgets/article_list.dart';
import 'package:news_feed/widgets/blog_tile.dart';
import 'package:news_feed/widgets/category_tile.dart';
import 'helper/news.dart';


class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  List<ArticleModel> articles = [];
  List<Widget> _widgetOptions;

  bool loading = true;

  @override
  void initState(){
    print("init");
    super.initState();
    _widgetOptions = _getWidgetOptions();
    _loadNews();
    print("loading news");
  }

  _loadNews() async{
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      loading = false;
      _widgetOptions = _getWidgetOptions();
      print("loaded");
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _getWidgetOptions(){
    print("gettingOptions");
    return <Widget>[
      Articles(loading: loading, articles: articles),
      SearchView(),
      Articles(loading: false, articles: favoriteArticles),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      // _loadNews();
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> _getNavbarItems(){
    List<String> names = ["Dashboard", "Search", "Favorite"];
    List<IconData> icons = [Icons.home, Icons.search_rounded, Icons.favorite];
    List<BottomNavigationBarItem> items = [];
    for(int i = 0; i < names.length; i++){
      items.add(
        BottomNavigationBarItem(
          icon: Icon(
            icons[i],
          ),
          label: names[i],
        ),
      );
    }
    return items;
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
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getNavbarItems(),
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}