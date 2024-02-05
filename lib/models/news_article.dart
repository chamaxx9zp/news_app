// lib/models/news_article.dart

class NewsArticle {
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;

  NewsArticle({
    required this.title,
    required this.url,
    required this.description,
    required this.urlToImage,
  });
}
