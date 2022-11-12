import 'package:al_quran_app/App/modules/views/intro_view.dart';
import 'package:al_quran_app/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: IntrodutionView(),
    );
  }
}
