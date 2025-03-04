import 'package:get/get.dart';
import '../model/news_model.dart';
import '../services/news_service.dart';

class NewsController extends GetxController {
  var newsList = <NewsModel>[].obs;
  var isLoading = false.obs;
  var selectedCategory = 'General'.obs; // Default category

  List<String> categories = [
    'General',
    'Business',
    'Technology',
    'Sports',
    'Entertainment',
    'Health',
    'Science'
  ];

  @override
  void onInit() {
    fetchNews(selectedCategory.value);
    super.onInit();
  }

  void fetchNews(String category) async {
    isLoading.value = true;
    try {
      var results = await NewsService.fetchNews(category);
      newsList.assignAll(results);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch news");
    } finally {
      isLoading.value = false;
    }
  }

  void changeCategory(String category) {
    if (category != selectedCategory.value) {
      selectedCategory.value = category;
      fetchNews(category);
    }
  }
}
