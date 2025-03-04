import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/news_model.dart';

class NewsService {
  static const String _baseUrl = "https://gnews.io/api/v4";
  static const String _apiKey = "cbf1a64f1694052111d29e204b816486";
  // static const String _apiKey = "d6544ae78cc1a085044c328cbcb5721a"; // Replace with your key

  // Fetch news by category
  static Future<List<NewsModel>> fetchNews(String category) async {

    // String q = "";
    // if (userInput != null && userInput.isNotEmpty) {
    //   q = userInput;
    // } else if (category != null) {
    //   q = "$category";
    // }

    try {
      final String selectedCategory = (category ?? "General").isNotEmpty ? category! : "General";

      final String apiUrl = "$_baseUrl/search?q=$selectedCategory&apikey=$_apiKey";
    // final String apiUrl = "$_baseUrl/top-headlines?category=$selectedCategory&apikey=$_apiKey";

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        if (jsonData.containsKey('articles') && jsonData['articles'] is List) {
          List<dynamic> articles = jsonData['articles'];
          return articles.map((json) => NewsModel.fromJson(json)).toList();
        } else {
          throw Exception("Invalid response format: No articles found.");
        }
      } else {
        throw Exception("Failed to load news. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching news by category: $e");
      return [];
    }
  }

  // void searchNews(String query) async {
  //   try {
  //     searchQuery.value = query.trim();
  //     if (query.trim().isEmpty) {
  //       fetchNews();
  //     } else {
  //       newsList.value = await _newsService.searchNews(query) ?? <NewsModel>[];
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to search news: $e', snackPosition: SnackPosition.BOTTOM);
  //     newsList.value = <NewsModel>[]; // Fallback to empty list
  //   }
  // }



  static Future<List<NewsModel>> searchNews(String query) async {
    try {
      // Encode query to handle special characters
      final String encodedQuery = Uri.encodeQueryComponent(query);
      final String apiUrl = "$_baseUrl/search?q=$encodedQuery&lang=en&token=$_apiKey";

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        if (jsonData['articles'] is List) {
          List<dynamic> articles = jsonData['articles'];
          return articles.map((json) => NewsModel.fromJson(json)).toList();
        } else {
          debugPrint("Invalid response format: No articles found.");
          return [];
        }
      } else {
        debugPrint("Failed to load search results. Status Code: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      debugPrint("Error fetching search results: $e");
      return [];
    }
  }

  // static Future<NewsModel> fetchNews(String category) async {
  //   final String apiUrl = "$_baseUrl/top-headlines?category=$category&lang=en&token=$_apiKey";
  //
  //   final response = await http.get(Uri.parse(apiUrl));
  //
  //   Map<String, dynamic> jsonData = jsonDecode(response.body);
  //   // List<dynamic> articles = jsonData['articles']; // Ensure this is a List
  //
  //   NewsModel model = NewsModel.fromJson(jsonData);
  //   return model;
  // }

}