import 'package:crypto_search/screens/search_screen/search_screen.dart';
import 'package:crypto_search/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: CustomTheme.classicTheme,
        home: SearchScreen());
  }
}
