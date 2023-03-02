import 'package:hive/hive.dart';


part 'article.g.dart';
@HiveType(typeId: 0)
class Article extends HiveObject
{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
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