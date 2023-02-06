import 'package:flutter/material.dart';
import 'package:intern10/models/article_model.dart';
import 'package:intern10/models/news_services.dart';

class MoreNewsProvider extends ChangeNotifier {
  late NewsService _newsService;

  MoreNewsProvider({required NewsService newsService}) {
    _newsService = newsService;
  }
  List<ArticleModel> _everything = [];
  List<ArticleModel> get headline => _everything;

  void getNews() async {
    _everything = await _newsService.getHeadlines();
    notifyListeners();
  }
}
