import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  NewsDetail({Key? key, required this.news}) : super(key: key);
  var news;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        leading: IconButton(onPressed:() => Get.back(), icon: Icon(Icons.chevron_left,color: Colors.white,size: 30,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height,
                    ),
                    Positioned(
                        child: Container(
                          height: Get.height*0.35,
                          width: Get.width,
                          child: Image.network(news.image,fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.amber,
                              alignment: Alignment.center,
                              child: const Text(
                                'Whoops!',
                                style: TextStyle(fontSize: 30),
                              ),
                            );
                          },),
                    )),
                    Positioned(
                       top: Get.height*0.30,
                        child: Container(
                      width: Get.width,
                      height: Get.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(38) , topRight: Radius.circular(38))
                      ),
                          child: Column(children: [
                            SizedBox(height: Get.height*0.03,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(DateFormat.yMMMMEEEEd('tr_TR').add_jms().format(news.date)
                                    .toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                                SizedBox(width: Get.width*0.08,)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(news.name,textAlign: TextAlign.left,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text("   "+news.description,style: TextStyle(fontSize: 16,color: Colors.black87),),
                            ),
                          ],),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
