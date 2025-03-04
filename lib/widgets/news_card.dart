// NEWS CARD WIDGET
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/news_model.dart';
import '../news_details_page.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;

  const NewsCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => NewsDetailPage(), arguments: news);
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
            children: [
              news.imageUrl != null
                  ? Image.network(news.imageUrl, fit: BoxFit.cover,
                width: double.infinity,
                height: 200,)
                  : Container(height: 200, color: Colors.grey,),
              Padding(padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(news.title, style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text(news.description, maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(news.source, style: TextStyle(color: Colors.blue),),
                        Text(
                          news.publishedAt, style: TextStyle(color: Colors.grey),)
                      ],
                    )
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }
}