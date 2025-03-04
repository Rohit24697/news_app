import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/widgets/news_card.dart';

import 'model/news_model.dart';
import 'news_details_page.dart';
import 'services/database_service.dart';

class ReadingHistoryPage extends StatefulWidget {
  @override
  _ReadingHistoryPageState createState() => _ReadingHistoryPageState();
}

class _ReadingHistoryPageState extends State<ReadingHistoryPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  List<NewsModel> _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final history = await _dbHelper.getSavedNews();
    setState(() {
      _history = history.reversed.toList(); // Show latest news on top
    });
  }

  void _clearHistory() async {
    await _dbHelper.clearHistory();
    setState(() {
      _history.clear();
    });
  }

  void _deleteNewsFromDatabase(NewsModel news) async {
    await _dbHelper.clearOneHistory(news);

    setState(() {
      _history.remove(news); // Remove the deleted item from the list
      getSavedList();
    });
    print("News saved to database: ${news.title}");
  }

  getSavedList() async {
    return _history = await _dbHelper.getSavedNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reading History"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _clearHistory,
          ),
        ],
      ),
      body: _history.isEmpty
          ? Center(child: Text("No history found"))
          : ListView.builder(
        itemCount: _history.length,
        itemBuilder: (context, index) {
          final news = _history[index];

          return GestureDetector(
            onTap: () {
              // Get.toNamed('/newsDetail', arguments: news);
              Get.to(() => NewsDetailPage(), arguments: news);
            },
            child: Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      _deleteNewsFromDatabase(news);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8), // Optional padding for better tap area
                      child: Icon(Icons.dangerous, color: Colors.red, size: 30),
                    ),
                  ),
                  // News Image
                  news.imageUrl.isNotEmpty
                      ? ClipRRect(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10)),
                    child: Image.network(news.imageUrl,
                        height: 200, width: double.infinity, fit: BoxFit.cover),
                  )
                      : SizedBox(height: 200, child: Icon(Icons.image_not_supported, size: 50)),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // News Title
                        Text(
                          news.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        SizedBox(height: 5),

                        // News Source & Date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              news.source,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                            ),
                            Text(
                              news.publishedAt,
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
