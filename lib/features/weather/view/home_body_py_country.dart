import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/features/weather/controller/repository/get_weather_repositoy.dart';
import 'package:weatherapp/features/weather/view/chart.dart';
import 'package:weatherapp/features/weather/view/home_view/widgets/banner_widget.dart';
import 'package:weatherapp/features/weather/view/home_view/widgets/list_hour_widget.dart';
import 'package:weatherapp/features/weather/view/home_view/widgets/my_search_bar.dart';

// ignore: must_be_immutable
class HomeBodyPyCountry extends StatelessWidget {
  HomeBodyPyCountry({super.key});
  GetWeatherRepository controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetWeatherRepository>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: controller.tempModel != null
              ? Column(
                  children: [
                    const SizedBox(height: 12),
                    BannerWidget(
                      country: controller.tempModel!.name,
                      minTemp: controller.tempModel!.main.tempMin,
                      maxTemp: controller.tempModel!.main.tempMax,
                      windImage: 'assets/images/windwave.png',
                      weatherImage: controller.switchWeatherImageCases(
                          controller.hourlyTempModel!.list![0].weather[0]
                              .description),
                      windSpeed:
                          '${controller.currentTempModel!.wind.speed} km/h',
                      temp:
                          '${((controller.currentTempModel!.main.temp) - 273.15).toStringAsFixed(0)} °c',
                    ),
                    const SizedBox(height: 24),
                    MySearchBar(),
                    ListHourWidget(),
                    Chart(),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      );
    });
  }
}
