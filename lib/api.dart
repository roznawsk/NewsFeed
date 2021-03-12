import 'package:http/http.dart' as http;
import 'dart:convert';


class Article {
  final String title;
  final String author;
  final Uri url;

  Article({this.title, this.author, this.url});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      author: json['author'],
      url: Uri.parse(json['url']),
    );
  }
}


Future<List<Article>> fetchArticles() async {
  String url = 'newsapi.org';
  var apiKey = '58d64ea857e04810aad29ff51f450963';
  var response = await http.get(Uri.https(url, '/v2/everything', {'q': 'pis', 'apiKey': apiKey}));

//  List<dynamic> articles = jsonDecode(response.body)['articles'];

  print('Status code: $response.statusCode');

  List<Article> articles = [for(dynamic a in jsonDecode(response.body)['articles']) Article.fromJson(a)];

  return articles;


//  for(String article in articles)
//
//  return response.body;


//  return Future

//  print(await http.read('https://example.com/foobar.txt'));

//  if (response.statusCode == 200) {
//    // If the server did return a 200 OK response,
//    // then parse the JSON.
//    return Album.fromJson(jsonDecode(response.body));
//  } else {
//    // If the server did not return a 200 OK response,
//    // then throw an exception.
//    throw Exception('Failed to load album');
//  }
}