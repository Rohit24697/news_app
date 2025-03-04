import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/services/database_service.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controller/theme_controller.dart';
import 'model/news_model.dart';

class NewsDetailPage extends GetView<ThemeController> {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final NewsModel news = Get.arguments as NewsModel; // Cast to NewsModel

    _checkDuplicateNewsToDatabase(news);
    // Function to open the news URL in the browser
    void _launchURL(String url) async {
      try {
        final Uri uri = Uri.parse(url);

        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          debugPrint("Could not launch $url");
          Get.snackbar("Error", "Could not open the link",
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (e) {
        debugPrint("Error launching URL: $e");
        Get.snackbar(
            "Error", "Invalid URL", snackPosition: SnackPosition.BOTTOM);
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Obx(() =>
            AppBar(
              backgroundColor:
              themeController.isDarkMode.value ? Colors.black : Colors.blue,
              iconTheme: IconThemeData(
                color: Colors.white, // Change back button color to white
              ),
              title: Text(news.source, style: TextStyle(color: Colors.white),),
              actions: [
                IconButton(
                  icon: Icon(Icons.share, color: Colors.white,),
                  onPressed: () {
                    Share.share("${news.title} - Read more at ${news.url}");
                  },
                ),
              ],
            )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // News Image
            news.imageUrl != null
                ? Image.network(news.imageUrl, fit: BoxFit.contain)
                : SizedBox(),

            SizedBox(height: 10),

            // News Title
            Text(
              news.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // Published Date
            Row(
              children: [
                Text(
                  news.publishedAt,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Spacer(),
                TextButton(
                  onPressed: () => _launchURL(news.url),
                  child: Text("Read More",
                      style: TextStyle(fontSize: 16, color: Colors.blue)),
                ),
              ],
            ),

            SizedBox(height: 10),

            // News Description
            Text(
              news.description ?? 'No description available',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 10),

            // Full News Content
            Text(
              news.content ?? '',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }


  // void _checkDuplicateNewsToDatabase(NewsModel news) async {
  //   final history = await _dbHelper.getSavedNews();
  //      bool isContain = history.any((news) =>
  //   news.title == history.title && news.description == newNews.description);
  //
  //   if(!isContain){
  //     _saveNewsToDatabase(news);
  //     print("News saved to database: ${news.title}");
  //   }
  //
  // }
  void _checkDuplicateNewsToDatabase(NewsModel newNews) async {
    final List<NewsModel> history = await _dbHelper.getSavedNews();

    // Check if the same news already exists
    bool isContain = history.any((news) =>
    news.title == newNews.title &&
        news.description == newNews.description &&
        news.url == newNews.url &&
        news.imageUrl == newNews.imageUrl &&
        news.source == newNews.source &&
        news.publishedAt == newNews.publishedAt &&
        news.content == newNews.content);


    if (!isContain) {
      _saveNewsToDatabase(newNews);
      print("News saved to database: ${newNews.title}");
    } else {
      print("Duplicate news entry: ${newNews.title}");
    }
  }


// Save the news to the database
  void _saveNewsToDatabase(NewsModel news) async {
    await _dbHelper.insertNews(news);
    print("News saved to database: ${news.title}");
  }
}
