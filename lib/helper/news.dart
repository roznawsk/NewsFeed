import 'dart:convert';

import 'package:news_feed/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{

  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=pl&apiKey=58d64ea857e04810aad29ff51f450963";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            urlToImage: element["urlToImage"],
            articleUrl: element["url"],
            content: element["content"]
          );
          news.add(articleModel);

        }
      });
    }
  }
}


class CategoryNews{

  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=pl&category=$category&apiKey=58d64ea857e04810aad29ff51f450963";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              urlToImage: element["urlToImage"],
              articleUrl: element["url"],
              content: element["content"]
          );
          news.add(articleModel);

        }
      });
    }
  }
}

class SearchNews{

  List<ArticleModel> news = [];

  Future<void> getNews(String q) async{
    String url = "https://newsapi.org/v2/everything?q=$q&apiKey=58d64ea857e04810aad29ff51f450963";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              urlToImage: element["urlToImage"],
              articleUrl: element["url"],
              content: element["content"]
          );
          news.add(articleModel);

        }
      });
    }
  }
}