import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/core/app_colors.dart';
import 'package:weatherapp/features/weather/controller/repository/get_weather_repositoy.dart';

// ignore: must_be_immutable
class MySearchBar extends StatelessWidget {
  MySearchBar({super.key});
  GetWeatherRepository controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: BorderRadius.circular(24),
      ),
      child: GetBuilder<GetWeatherRepository>(builder: (controller) {
        return TextField(
          controller: controller.searchController,
          decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.primaryColor,
                size: 30,
              )),
          onSubmitted: (value) async {
            await controller.countrySearch(controller.searchController.text);
            controller.country = value;
            controller.getWeather();
          },
        );
      }),
    );
  }
}
