import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/services/api_services.dart';
import 'package:newsapp/views/error_page.dart';
import '../models/news_model.dart';

class NewsController extends GetxController {
  final newsList = <Result>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchNews({String? url}) async {
    try{
      isLoading(true);
      var news = await ApiServices.fetchNews(url: url);
      if (news!.success == true) {
        newsList.value = news.result;
        isLoading(false);
      }else{
        Get.to(ErrorPage());
      }
    }
    catch(err){
      Get.off(ErrorPage());
    }
    }
  }