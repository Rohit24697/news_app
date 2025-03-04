import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/search_controller.dart' as app_search;
import 'news_details_page.dart';

class SearchPage extends StatelessWidget {
  final app_search.SearchController searchController = Get.put(app_search.SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController.searchTextController,
          onChanged: (value) {
            searchController.searchNews(value); // Search when text changes
          },
          decoration: InputDecoration(
            hintText: 'Search for news...',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Obx(() {
        if (searchController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (searchController.searchResults.isEmpty) {
          return Center(child: Text('No results found.', style: TextStyle(fontSize: 16)));
        }
        return ListView.builder(
          itemCount: searchController.searchResults.length,
          itemBuilder: (context, index) {
            final news = searchController.searchResults[index];
            return ListTile(
              leading: news.imageUrl != null
                  ? Image.network(news.imageUrl, width: 50, height: 50, fit: BoxFit.cover)
                  : Icon(Icons.image, size: 50, color: Colors.grey),
              title: Text(news.title, maxLines: 2, overflow: TextOverflow.ellipsis),
              subtitle: Text(news.description ?? '', maxLines: 2, overflow: TextOverflow.ellipsis),
              onTap: () {
                // Get.toNamed('/newsDetail', arguments: news);
                Get.to(() => NewsDetailPage(), arguments: news);
              },
            );
          },
        );
      }),
    );
  }
}
