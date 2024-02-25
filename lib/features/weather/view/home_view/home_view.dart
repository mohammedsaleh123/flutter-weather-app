import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/core/app_colors.dart';
import 'package:weatherapp/core/components/custom_text.dart';
import 'package:weatherapp/features/weather/controller/repository/get_weather_repositoy.dart';
import 'package:weatherapp/features/weather/view/home_view/widgets/home_body_widget.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});
  GetWeatherRepository controller = Get.put(GetWeatherRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const CustomText(
          text: 'Weather',
          color: AppColors.white,
        ),
        centerTitle: true,
      ),
      body: HomeBodyWidget(),
    );
  }
}
