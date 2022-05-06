import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapp/widgets/red_button.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: Get.height*0.2,),
              Icon(Icons.error,size: 120,color: Colors.red.shade700,),
              SizedBox(height: Get.height*0.05,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Bağlantı Hatası Lütfen İnternet Bağlantınızı Kontrol Ediniz",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
              ),
              RedButton(title: "Çıkış", onClick: ()=> exit(0)),
            ],
          )
        ),
      ),
    );
  }
}
