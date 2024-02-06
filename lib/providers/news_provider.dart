import 'package:flutter/material.dart';
import '../models/news_source.dart';
import '../services/news_service.dart';

class NewsProvider with ChangeNotifier {
  final NewsService _newsService = NewsService();
  List<NewsSource> _sources = [];

  List<NewsSource> get sources => _sources;

  Future<void> fetchSources() async {
    try {
      _sources = await _newsService.getSources();
      notifyListeners();
    } catch (error) {
      // Handle error appropriately, e.g., show error message
      print('Failed to fetch news sources: $error');
    }
  }
}
