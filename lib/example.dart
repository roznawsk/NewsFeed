import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final String title = "Example";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: MainScreen(title),
    );
  }
}


class MainScreen extends StatelessWidget {

  MainScreen(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget> [
          Categories(),
          Expanded(
            child: ArticleList(),
          ),
        ],
      ),
    );
  }
}


class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String title = "Example";
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}


class ArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: 120.0,
                color: Colors.orange,
              ),
              Container(
                height: 120.0,
                color: Colors.blue,
              ),
              Container(
                height: 120.0,
                color: Colors.yellow,
              ),
              Container(
                height: 120.0,
                color: Colors.pink,
              ),
              Container(
                height: 120.0,
                color: Colors.brown,
              ),
              Container(
                height: 120.0,
                color: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
