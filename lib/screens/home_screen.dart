import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/news_provider.dart'; // Import your NewsProvider

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Sources'),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, _) {
          if (newsProvider.sources.isEmpty) {
            // If sources list is empty, fetch data
            newsProvider.fetchSources();
            return Center(child: CircularProgressIndicator());
          } else {
            // If sources list is not empty, display data
            return ListView.builder(
              itemCount: newsProvider.sources.length,
              itemBuilder: (context, index) {
                final source = newsProvider.sources[index];
                return ListTile(
                  title: Text(source.name),
                  subtitle: Text(source.description),
                  onTap: () {
                    // Handle onTap event
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
