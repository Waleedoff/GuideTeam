import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:guide_team/Features/chatFeature/chat/view/screen/chat_screen.dart';
import 'package:guide_team/Features/splash/view/screen/splash.dart';
import 'package:guide_team/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}
