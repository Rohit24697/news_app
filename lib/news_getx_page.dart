import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/category_controller.dart';
import 'package:news_app/widgets/news_card.dart';
import 'package:news_app/widgets/news_cards.dart';
import 'package:news_app/widgets/news_catagory.dart';

import 'controller/theme_controller.dart';

class NewsGetxPage extends GetView<CategoryController> {
  NewsGetxPage({super.key});

  final CategoryController newsController = Get.put(CategoryController());
  final ThemeController themeController = Get.find();
  final TextEditingController searchController = TextEditingController();

  final List<String> categories = [
    'General',
    'Business',
    'Technology',
    'Sports',
    'Entertainment',
    'Health',
    'Science'
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: themeController.isDarkMode.value ? Colors.white24 : Colors.white,
      drawer: Obx(() => Drawer(
        backgroundColor: themeController.isDarkMode.value
            ? Colors.black.withValues(alpha: 0.8)
            : Colors.white,  // Dynamic background color
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: themeController.isDarkMode.value
                    ? Colors.black
                    : Colors.deepPurple, // Dynamic header color
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'News App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Stay informed',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black), // Adjust icon color
              title: Text(
                "Home",
                style: TextStyle(
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black), // Adjust text color
              ),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.history,
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black),
              title: Text(
                "Reading History",
                style: TextStyle(
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {},
            ),
            Divider(color: themeController.isDarkMode.value ? Colors.white54 : Colors.black54), // Adjust divider color
            ListTile(
              leading: Icon(
                themeController.isDarkMode.value
                    ? Icons.dark_mode
                    : Icons.light_mode,
                color: themeController.isDarkMode.value ? Colors.white : Colors.black,
              ),
              title: Text(
                themeController.isDarkMode.value ? "Dark Mode" : "Light Mode",
                style: TextStyle(
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black),
              ),
              trailing: Switch(
                value: themeController.isDarkMode.value,
                onChanged: (value) {
                  themeController.toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Obx(() => AppBar(
          backgroundColor:
          themeController.isDarkMode.value ? Colors.black12 : Colors.blue,
          iconTheme: IconThemeData(
            color: Colors.white, // Change back button color to white
          ),
          title: Text(
            "News App",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 25.0,
              ),
              onPressed: () {
                print("Search clicked!");
              },
            ),
          ],
        )),
      ),

      body: SafeArea(
        child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() =>Row(
                  children: categories.map((category) {
                    bool isSelected = newsController.selectedCategory.value ==category.toLowerCase();

                    return GestureDetector(
                      onTap: ()=>newsController.selectCategory(category.toLowerCase()),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.purple : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            if (isSelected) //  Show icon only if selected
                              Icon(Icons.check_circle, color: Colors.white, size: 18),
                            if (isSelected) SizedBox(width: 5),
                            SizedBox(width: 5,),
                            Text(category,style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),)
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                ),
              ),
              // NEWS LIST
              Expanded(child: Obx(() {
                if (newsController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemCount: newsController.newsList.length,
                    itemBuilder: (context, index) {
                      final news = newsController.newsList[index];
                      return NewsCard(news: news);
                    });
              })
              )
            ])
        // Column(
        //   children: [
        //     /// SINGLECHILDSCROLLVIEW FOR NEWS CATEGORIES
        //     SizedBox(
        //       height: 50, // Adjust height for better visibility
        //       child: SingleChildScrollView(
        //         scrollDirection: Axis.horizontal,
        //         child: Row(
        //           children: [
        //             const SizedBox(width: 8), // Padding at start
        //             NewsCategory(label: 'General', isSelected: true),
        //             NewsCategory(label: 'Business'),
        //             NewsCategory(label: 'Technology'),
        //             NewsCategory(label: 'Sports'),
        //             NewsCategory(label: 'Entertainment'),
        //             NewsCategory(label: 'Health'),
        //             NewsCategory(label: 'Science'),
        //             const SizedBox(width: 8), // Padding at end
        //           ],
        //         ),
        //       ),
        //     ),
        //     // News Articles List
        //     // Expanded(
        //     //   child: ListView(
        //     //     children: const [
        //     //       NewsCard(
        //     //         imageUrl: "",
        //     //         title: "",
        //     //         description: "",
        //     //         source: "",
        //     //         date: "",
        //     //       ),
        //     //     ],
        //     //   ),
        //     // ),
        //     // NEWS LIST
        //     Expanded(child: Obx(() {
        //       if (newsController.isLoading.value) {
        //         return Center(child: CircularProgressIndicator());
        //       }
        //       return ListView.builder(
        //           itemCount: newsController.newsList.length,
        //           itemBuilder: (context, index) {
        //             final news = newsController.newsList[index];
        //             return NewsCard(news: news);
        //           });
        //     })
        //     )
        //   ],
        // ),
      ),
    ));
  }
}
