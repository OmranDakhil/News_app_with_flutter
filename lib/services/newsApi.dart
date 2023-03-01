
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';
import '../models/listOfArticle.dart';
class NewsApi
{
  final String apiKey='cf6a728d81d241b5a76722e1ee27ae4e';
   Future<List<Article>> fetchAticles(String country,String category
       ) async
   {
     try {
       http.Response response;
       if(country=="all")
         response = await http
             .get(
             Uri.parse('https://newsapi.org/v2/top-headlines?category=$category&apiKey=$apiKey'));
       else response = await http
           .get(
           Uri.parse('https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$apiKey'));
       if(response.statusCode==200)
         {
           String data=response.body;
           var jsonData= jsonDecode(data);
           Articles articles=Articles.fromJson(jsonData);
           List<Article> articlesList
           // for(var article in articles.articles)
           //   articlesList.add(Article.fromJson(article));
                 =articles.articles.map((e) => Article.fromJson(e)).toList();
           return articlesList;
         }
       else{
         print('hiiiiiiiiiistatusCose=${response.statusCode}');
         throw Exception('Failed to load articales');
       }
     }catch(exp)
     {
       print(exp);
       throw Exception('Failed to load articles');
     }

}


}