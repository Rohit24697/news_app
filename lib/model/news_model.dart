
class NewsModel {
  String title;
  String description;
  String url;
  String imageUrl;
  String source;
  String publishedAt;
  final String content;

  NewsModel({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.source,
    required this.publishedAt,
    required this.content,
  });

  // Convert JSON to NewsModel
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? 'No title',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      imageUrl: json['image'] ?? '',
      source: json['source']['name'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? json['description'] ?? 'No Content Available',
    );
  }

  // Convert Map (from Database) to NewsModel
  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      title: map['title'] ?? 'No title',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      source: map['source'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }

  // Convert NewsModel to Map (for saving in Database)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'imageUrl': imageUrl,
      'source': source,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}

// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));
//
// String newsModelToJson(NewsModel data) => json.encode(data.toJson());
//
// class NewsModel {
//   final int? totalArticles;
//   final List<Article>? articles;
//
//   NewsModel({
//     this.totalArticles,
//     this.articles,
//   });
//
//   factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
//     totalArticles: json["totalArticles"],
//     articles: json["articles"] == null ? [] : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "totalArticles": totalArticles,
//     "articles": articles == null ? [] : List<dynamic>.from(articles!.map((x) => x.toJson())),
//   };
// }
//
// class Article {
//   final String? title;
//   final String? description;
//   final String? content;
//   final String? url;
//   final String? image;
//   final DateTime? publishedAt;
//   final Source? source;
//
//   Article({
//     this.title,
//     this.description,
//     this.content,
//     this.url,
//     this.image,
//     this.publishedAt,
//     this.source,
//   });
//
//   factory Article.fromJson(Map<String, dynamic> json) => Article(
//     title: json["title"],
//     description: json["description"],
//     content: json["content"],
//     url: json["url"],
//     image: json["image"],
//     publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
//     source: json["source"] == null ? null : Source.fromJson(json["source"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "title": title,
//     "description": description,
//     "content": content,
//     "url": url,
//     "image": image,
//     "publishedAt": publishedAt?.toIso8601String(),
//     "source": source?.toJson(),
//   };
// }
//
// class Source {
//   final String? name;
//   final String? url;
//
//   Source({
//     this.name,
//     this.url,
//   });
//
//   factory Source.fromJson(Map<String, dynamic> json) => Source(
//     name: json["name"],
//     url: json["url"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "url": url,
//   };
// }
