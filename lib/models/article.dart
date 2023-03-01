class Article
{
  var title;
  var descrption;
  var imageUrl;
  var newUrl;

  Article( {required this.title, required this.descrption, required this.imageUrl, required this.newUrl});
  factory Article.fromJson(Map<String , dynamic> jsonData)
  {
    return Article(
      title: jsonData['title'] ?? "unknown",
      descrption: jsonData['description']?? "unknown",
      imageUrl: jsonData['urlToImage']?? 'urlImage',
      newUrl: jsonData['url'] ?? "unknown"
    );
  }
}