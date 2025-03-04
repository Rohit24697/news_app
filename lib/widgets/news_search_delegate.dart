// // SEARCH DELEGATE FOR SEARCHING NEWS
// import 'package:flutter/material.dart';
//
// import '../controller/category_controller.dart';
// import 'news_card.dart';
//
// class NewsSearchDelegate extends SearchDelegate {
//   final CategoryController newsController;
//
//   NewsSearchDelegate(this.newsController);
//
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(icon: Icon(Icons.clear), onPressed: () => query = ""),
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     final results = newsController.newsList.where((news) =>
//         news.title.toLowerCase().contains(query.toLowerCase())).toList();
//
//     return ListView.builder(itemCount: results.length,
//       itemBuilder: (context, index) => NewsCard(news: results[index]),);
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container();
//   }
//
// }