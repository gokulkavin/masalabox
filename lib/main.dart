import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masalabox/views/splash_screen.dart';

import 'controller/data_controller.dart';

void main() {
  Get.put(DataController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
