import 'package:flutter/material.dart';
import '../models/news_source.dart';
import '../services/news_service.dart';


class NewsProvider with ChangeNotifier {
  final NewsService _newsService = NewsService();
  List<NewsSource> _sources = [];

  List<NewsSource> get sources => _sources;

  Future<List<NewsSource>> fetchSources() async {
    _sources = await _newsService.getSources();
    notifyListeners();
    return _sources; // Return the list of sources
  }
}

