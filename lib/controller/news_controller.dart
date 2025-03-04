import 'package:get/get.dart';
import '../model/news_model.dart';
import '../services/news_service.dart';

class NewsController extends GetxController {
  final newsList = <NewsModel>[].obs;
  final isLoading = false.obs;
  final selectedCategory = 'General'.obs; // Default category

  final List<String> categories = [
    'General',
    'Business',
    'Technology',
    'Sports',
    'Entertainment',
    'Health',
    'Science'
  ].obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchNews(category);
  // }

  void fetchNews(String category) async {
    try {
      isLoading.value = true;
      // List<NewsModel> fetchedNews = await NewsService.fetchNews(category);
      // newsList.value = fetchedNews;
    }
    // isLoading.value = true;
    // try {
    //   String category = selectedCategory.value;
    //   // var results = await NewsService.fetchNews(category);
    //   List<NewsModel> news = await NewsService.fetchNews(category);
    //   newsList.assignAll(news);
    // }
    catch (e) {
      Get.snackbar("Error", "Failed to fetch news");
      print("Error fetching news: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void changeCategory(String category) {
    if (category != selectedCategory.value) {
      selectedCategory.value = category;
      fetchNews(selectedCategory.value);
    }
  }
}
