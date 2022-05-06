import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/news_model.dart';


class ApiServices {
  static var client = http.Client();

  static Future<News?> fetchNews({String? url}) async {
    var response = await client.get(Uri.parse(
      url == null ? "https://api.collectapi.com/news/getNews?country=tr" : "https://api.collectapi.com/news/getNews?country=tr&tag=$url",),
    headers: {
      "Content-type": "application/json",
      "Authorization": "apikey 70os9bSSNy1OrDlz4Z7BSm:0aa27r5IzIRCQIx20jTeRS"
    });
    debugPrint("response giris yapildi");
    if(response.statusCode == 200) {
      var jsonString = response.body;
      debugPrint(jsonString);
      return newsFromJson(jsonString);
    }
    else {
      return null;
    }
  }
}
