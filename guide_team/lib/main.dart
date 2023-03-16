import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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
      home: OnBoardingPage(),
    );
  }
}
