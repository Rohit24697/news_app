import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/theme_controller.dart';

import 'controller/category_controller.dart';
import 'news_getx_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder((){
        Get.put(CategoryController());
        Get.lazyPut<ThemeController>(() => ThemeController());
      }),
      home: NewsGetxPage(),
    );
  }
}
