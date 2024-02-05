// lib/providers/news_provider.dart

import 'package:flutter/material.dart';
import '../models/news_article.dart';
import '../services/news_service.dart';

class NewsProvider with ChangeNotifier {
  final NewsService _newsService = NewsService();
  List<NewsArticle> _news = [];

  List<NewsArticle> get news => _news;

  Future<void> fetchNews() async {
    _news = await _newsService.getNews();
    notifyListeners();
  }
}
