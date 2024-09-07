import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:videochat/pages/homepage.dart';
import 'package:videochat/pages/meetingjoincode.dart';
import 'package:videochat/video_call.dart';
// import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => const HomePage()),
      GetPage(
          name: '/joinWithCode',
          page: () => JoinWithCode()), // Join with code route
      GetPage(
          name: '/videoCall',
          page: () => VideoCall(
                channelName: '',
              )),
    ],
    // home: HomePage(),
  ));
}
