import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/core/app_theme.dart';
import 'package:weatherapp/features/weather/view/home_view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: appTheme,
      home: HomeView(),
    );
  }
}
