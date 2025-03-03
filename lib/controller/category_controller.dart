import 'package:get/get.dart';

import '../model/news_model.dart';
import '../services/news_service.dart';

class CategoryController extends GetxController {
  var newsList = <NewsModel>[].obs;
  var isLoading = false.obs;
  var selectedCategory = 'General'.obs; // Default selected category
  var searchResults = <NewsModel>[].obs;

  @override
  void onInit(){
    selectCategory(selectedCategory.value);
    super.onInit();
  }

  Future<void> selectCategory(String category) async {
    try{
      isLoading(true);
      selectedCategory.value=category;
      var news = await NewsService.fetchNews(category);
      newsList.assignAll(news);
    }catch(e){
      print("Error:$e");
    }finally{
      isLoading(false);
    }
  }
}
