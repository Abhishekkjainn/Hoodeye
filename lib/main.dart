import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoodeye/controller/finalController.dart';
import 'package:hoodeye/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  LocationController locationController = Get.put(LocationController());
  CrimeController crimeController = Get.put(CrimeController());
  ResourceController resourceController = Get.put(ResourceController());
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
