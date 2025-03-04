// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/news_model.dart';
import '../services/news_service.dart';
// import '../services/api_service.dart';

class SearchController extends GetxController {
  TextEditingController searchTextController = TextEditingController();
  var searchResults = <NewsModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Listen to input changes and debounce API calls
    debounce(
      searchTextController.text.obs,
          (query) => searchNews(query),
      time: const Duration(milliseconds: 500),
    );
  }


  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }

  void searchNews(String query) async {
    query = query.trim(); // Trim spaces

    if (query.isEmpty) {
      searchResults.clear();
      return;
    }
    isLoading.value = true;
    try {
      List<NewsModel> results = await NewsService.searchNews(query);
      searchResults.assignAll(results);
    } catch (e) {
      debugPrint("Error fetching search results: $e");
    }finally {
      isLoading.value = false;
    }
  }
}