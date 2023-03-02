import 'package:hive/hive.dart';

class Article
{
  final String title;
  final String description;
  final String imageUrl;
  final String newUrl;

  Article( {required this.title, required this.description, required this.imageUrl, required this.newUrl});
  factory Article.fromJson(Map<String , dynamic> jsonData)
  {
    return Article(
      title: jsonData['title'] ?? "unknown",
        description: jsonData['description']?? "unknown",
      imageUrl: jsonData['urlToImage']?? 'urlImage',
      newUrl: jsonData['url'] ?? "unknown"
    );
  }
}