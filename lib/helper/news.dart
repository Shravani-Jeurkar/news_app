import 'dart:convert';
import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

    var client = http.Client();
    Future<void> getNews() async{
      var url = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=f1fb61b201314e9a901f4deb07c53ed6';
      Uri uri = Uri.parse(url);
      var response = await http.get(uri);

      var jsonData = jsonDecode(response.body);

      if(jsonData['status'] == "ok"){
        jsonData["articles"].forEach((element){
          if(element["urlToImage"] != null && element["description"] != null && element['author'] != null && element['content'] != null)
          {
            ArticleModel articleModel = ArticleModel
            (
              author: element['author'],
              title: element['title'],
              desc: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
            );
            // final articleModel = articleModelFromJson(element);
            news.add(articleModel);
          }
        });
      }
  }
}

class CNews{

  List<ArticleModel> cnews = [];

  var client = http.Client();
  Future<void> getCNews(String category) async{
    var url = 'https://newsapi.org/v2/top-headlines?category=$category&country=in&category=business&apiKey=f1fb61b201314e9a901f4deb07c53ed6';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null && element['author'] != null && element['content'] != null)
        {
          ArticleModel articleModel = ArticleModel
            (
            author: element['author'],
            title: element['title'],
            desc: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          // final articleModel = articleModelFromJson(element);
          cnews.add(articleModel);
        }
      });
    }
  }
}