import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapp/controllers/news_controller.dart';
import 'package:newsapp/widgets/news_card.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  final NewsController controller = Get.put(NewsController());
  var _isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Haberler",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child:Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ChoiceChip(
                        backgroundColor: Colors.transparent,
                        label: Text('Genel',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        selected: _isSelected.value,
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.red, width: 1.5)),
                        onSelected: (isSelected) {
                          controller.fetchNews(url: "general");
                          _isSelected.value = isSelected;
                        },
                      ),
                      ChoiceChip(
                        backgroundColor: Colors.transparent,
                        label: Text('Spor',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        selected: _isSelected.value,
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.red, width: 1.5)),
                        onSelected: (isSelected) {
                          controller.fetchNews(url: "sport");
                          _isSelected.value = isSelected;
                        },
                      ),
                      ChoiceChip(
                        backgroundColor: Colors.transparent,
                        label: Text('Ekonomi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        selected: _isSelected.value,
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.red, width: 1.5)),
                        onSelected: (isSelected) {
                          controller.fetchNews(url: "economy");
                          _isSelected.value = isSelected;
                        },
                      ),
                      ChoiceChip(
                        backgroundColor: Colors.transparent,
                        label: Text('Teknoloji',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        selected: _isSelected.value,
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.red, width: 1.5)),
                        onSelected: (isSelected) {
                          controller.fetchNews(url: "technology");
                          _isSelected.value = isSelected;
                        },
                      ),
                    ],
                  ),
                Obx(()=> controller.isLoading.value ? Center(heightFactor: 12,child: CircularProgressIndicator(color: Colors.red,)) : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.newsList.length,
                  itemBuilder: (context, index) {
                    return controller.newsList.length == 0 ? CircularProgressIndicator() : NewsCard(news: controller.newsList[index]);
                  }
              )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
