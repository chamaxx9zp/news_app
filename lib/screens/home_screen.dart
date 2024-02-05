// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter News App'),
      ),
      body: FutureBuilder(
        future: newsProvider.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: newsProvider.news.length,
              itemBuilder: (context, index) {
                final article = newsProvider.news[index];
                return ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.description ?? 'No description available'),
                  onTap: () {
                    // Handle article tap
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
