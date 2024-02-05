// lib/services/news_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class NewsService {
  final String apiKey = '4e78306cc76e4cdc813358fc7a613c2b'; // Replace with your News API key

  Future<List<NewsArticle>> getNews() async {
    final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['articles'];
      return data.map((article) => NewsArticle(
        title: article['title'] ?? '',
        description: article['description'] ?? '',
        url: article['url'] ?? '',
        urlToImage: article['urlToImage'] ?? '',
      )).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
