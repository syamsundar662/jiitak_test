import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jiitak_test/utils/theme_data.dart';
import 'package:jiitak_test/view/initial_screen./initial_screen.dart';
import 'package:jiitak_test/view/root/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      home:  InitilaScreen(),
    );
  }
}
