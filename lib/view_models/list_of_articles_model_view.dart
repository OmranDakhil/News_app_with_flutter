

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/article.dart';
import '../services/newsApi.dart';


class ArticlesListViewModel with ChangeNotifier
{
  List<Article> _articles=[];
  String country_value="egypt";
  String category_value="general";
  Map<String,String> countries=
  {
    'all':'all',
    'united states':'us',
    'egypt':'eg',
    'canada':'ca',
    'japan':'jp'
  };
  List<String> categories=[
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology'

  ];
  Future<void> fetchArticles() async{
    _articles=await NewsApi().fetchAticles(countries[country_value]!,category_value);
    notifyListeners();
  }
  void change_country_value(String? new_value)
  {
    country_value=new_value!;
    notifyListeners();
  }
  void change_category_value(String? new_value)
  {
    category_value=new_value!;
    notifyListeners();
  }

  List<Article> get articles=> _articles;
  void openURL(int i ) async
  {
    final Uri _url = Uri.parse(_articles[i].newUrl);
    await launchUrl(_url,mode: LaunchMode.externalApplication);
  }
}