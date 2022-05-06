import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapp/views/news_details.dart';

class NewsCard extends StatelessWidget {
  NewsCard({Key? key,required this.news}) : super(key: key);
  var news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
      child: Container(
        height: Get.height*0.13,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                news.image,
                fit: BoxFit.fitHeight,
                width: Get.width*0.32,
                height: Get.height,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.amber,
                    alignment: Alignment.center,
                    child: const Text(
                      'Whoops!',
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                },
              ),
            ),
            SizedBox(width: Get.width*0.02),
            Expanded(child: Text(news.name
              ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
            SizedBox(width: Get.width*0.02),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red,width: 2),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Center(
                child: InkWell(
                    onTap: (){
                      Get.to(NewsDetail(news: news));
                    },
                    child: Icon(Icons.chevron_right_rounded,color: Colors.red,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
