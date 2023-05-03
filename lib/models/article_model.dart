class ArticleModel{
  String author;
  String title;
  String desc;
  String url;
  String urlToImage;
  String content;

  ArticleModel({
    required this.author,
    required this.title,
    required this.desc,
    required this.url,
    required this.urlToImage,
    required this.content,});
}

// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

// import 'dart:convert';
//
// ArticleModel articleModelFromJson(String str) => ArticleModel.fromJson(json.decode(str));
//
// String articleModelToJson(ArticleModel data) => json.encode(data.toJson());
//
// class ArticleModel {
//   String author;
//   String title;
//   String desc;
//   String url;
//   String urlToImage;
//   String content;
//
//   ArticleModel({
//     required this.author,
//     required this.title,
//     required this.desc,
//     required this.url,
//     required this.urlToImage,
//     required this.content,
//   });
//
//   factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
//     author: json["author"],
//     title: json["title"],
//     desc: json["description"],
//     url: json["url"],
//     urlToImage: json["urlToImage"],
//     content: json["content"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "author": author,
//     "title": title,
//     "description": desc,
//     "url": url,
//     "urlToImage": urlToImage,
//     "content": content,
//   };
// }
