import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_source.dart';

class NewsService {
  Future<List<NewsSource>> getSources() async {
    final apiKey = '4e78306cc76e4cdc813358fc7a613c2b';
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines/sources?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final sourcesJson = jsonDecode(response.body)['sources'] as List<dynamic>;
      return sourcesJson
          .map((sourceJson) => NewsSource.fromJson(sourceJson))
          .toList();
    } else {
      throw Exception('Failed to fetch news sources');
    }
  }
}
