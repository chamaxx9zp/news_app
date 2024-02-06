
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: FutureBuilder(
        future: newsProvider.fetchSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: newsProvider.sources.length,
              itemBuilder: (context, index) {
                final source = newsProvider.sources[index];
                return ListTile(
                  title: Text(source.name),
                  subtitle: Text(source.description),
                  onTap: () {
                    // Handle source tap
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
