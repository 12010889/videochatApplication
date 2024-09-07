import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:videochat/pages/homepage.dart';
import 'package:videochat/pages/meetingjoincode.dart';
// import 'package:get/get.dart';
// import 'package:video_conference/pages/homepage.dart';

void main() {
  runApp(const GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => HomePage()), // Define the home route
      GetPage(name: '/joinWithCode', page: () => JoinWithCode()),
    ],
    home: HomePage(),
  ));
}
