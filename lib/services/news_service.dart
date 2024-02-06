import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_source.dart';

class NewsService {
  final String apiKey = '4e78306cc76e4cdc813358fc7a613c2b'; // Replace with your News API key

  Future<List<NewsSource>> getSources() async {
  final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines/sources?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      print(response.body); // Add this line to print the response
      final List<dynamic> data = json.decode(response.body)['sources'];
      return data.map((source) => NewsSource(
        id: source['id'],
        name: source['name'],
        description: source['description'],
        url: source['url'],
        category: source['category'],
        language: source['language'],
        country: source['country'],
      )).toList();
    } else {
      throw Exception('Failed to load news sources');
    }
  }
}

