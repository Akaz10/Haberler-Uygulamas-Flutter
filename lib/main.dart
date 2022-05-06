import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/views/home_page.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Haberler",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
