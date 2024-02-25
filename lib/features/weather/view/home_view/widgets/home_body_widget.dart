import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/features/weather/controller/repository/get_weather_repositoy.dart';
import 'package:weatherapp/features/weather/view/chart.dart';
import 'package:weatherapp/features/weather/view/home_view/widgets/banner_widget.dart';
import 'package:weatherapp/features/weather/view/home_view/widgets/list_hour_widget.dart';
import 'package:weatherapp/features/weather/view/home_view/widgets/my_search_bar.dart';

class HomeBodyWidget extends StatelessWidget {
  HomeBodyWidget({super.key});
  final GetWeatherRepository controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.getHourlyWeather();
    return GetBuilder<GetWeatherRepository>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 0),
        child: controller.currentTempModel != null &&
                controller.hourlyTempModel != null
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BannerWidget(
                      country:
                          controller.isSearch && controller.tempModel != null
                              ? controller.tempModel!.name
                              : controller.currentTempModel!.name,
                      minTemp:
                          controller.isSearch && controller.tempModel != null
                              ? controller.tempModel!.main.tempMin
                              : controller.currentTempModel!.main.tempMin,
                      maxTemp:
                          controller.isSearch && controller.tempModel != null
                              ? controller.tempModel!.main.tempMax
                              : controller.currentTempModel!.main.tempMax,
                      windImage: 'assets/images/windwave.png',
                      weatherImage:
                          controller.isSearch && controller.tempModel != null
                              ? controller.switchWeatherImageCases(
                                  controller.tempModel!.weather[0].description)
                              : controller.switchWeatherImageCases(controller
                                  .hourlyTempModel!
                                  .list![0]
                                  .weather[0]
                                  .description),
                      windSpeed: controller.isSearch &&
                              controller.tempModel != null
                          ? '${controller.tempModel!.wind.speed} km/h'
                          : '${controller.currentTempModel!.wind.speed} km/h',
                      temp: controller.isSearch && controller.tempModel != null
                          ? '${((controller.tempModel!.main.temp) - 273.15).toStringAsFixed(0)} °c'
                          : '${((controller.currentTempModel!.main.temp) - 273.15).toStringAsFixed(0)} °c',
                    ),
                    MySearchBar(),
                    ListHourWidget(),
                    Chart(),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}


// BarChart(
//                         BarChartData(
//                           groupsSpace: 30,
//                           backgroundColor: AppColors.lightPrimaryColor,
//                           alignment: BarChartAlignment.center,
//                           gridData: const FlGridData(show: false),
//                           maxY: 40,
//                           barGroups: [
//                             BarChartGroupData(
//                               x: (controller
//                                       .hourlyTempModel!.list![0].main.temp -
//                                   273.15.toInt()),
//                               groupVertically: true,
//                               barRods: [
//                                 BarChartRodData(
//                                     width: 10,
//                                     color: AppColors.white,
//                                     toY: controller.hourlyTempModel!.list![0]
//                                             .main.temp -
//                                         273.15)
//                               ],
//                             ),
//                             BarChartGroupData(
//                               x: (controller
//                                       .hourlyTempModel!.list![6].main.temp -
//                                   273.15.toInt()),
//                               groupVertically: true,
//                               barRods: [
//                                 BarChartRodData(
//                                     width: 10,
//                                     color: AppColors.white,
//                                     toY: controller.hourlyTempModel!.list![6]
//                                             .main.temp -
//                                         273.15)
//                               ],
//                             ),
//                             BarChartGroupData(
//                               x: (controller
//                                       .hourlyTempModel!.list![12].main.temp -
//                                   273.15.toInt()),
//                               groupVertically: true,
//                               barRods: [
//                                 BarChartRodData(
//                                     width: 10,
//                                     color: AppColors.white,
//                                     toY: controller.hourlyTempModel!.list![12]
//                                             .main.temp -
//                                         273.15)
//                               ],
//                             ),
//                             BarChartGroupData(
//                               x: (controller
//                                       .hourlyTempModel!.list![18].main.temp -
//                                   273.15.toInt()),
//                               groupVertically: true,
//                               barRods: [
//                                 BarChartRodData(
//                                     width: 10,
//                                     color: AppColors.white,
//                                     toY: controller.hourlyTempModel!.list![18]
//                                             .main.temp -
//                                         273.15)
//                               ],
//                             ),
//                             BarChartGroupData(
//                               x: (controller
//                                       .hourlyTempModel!.list![24].main.temp -
//                                   273.15.toInt()),
//                               groupVertically: true,
//                               barRods: [
//                                 BarChartRodData(
//                                     width: 10,
//                                     color: AppColors.white,
//                                     toY: controller.hourlyTempModel!.list![24]
//                                             .main.temp -
//                                         273.15)
//                               ],
//                             ),
//                             BarChartGroupData(
//                               x: (controller
//                                       .hourlyTempModel!.list![30].main.temp -
//                                   273.15.toInt()),
//                               groupVertically: true,
//                               barRods: [
//                                 BarChartRodData(
//                                     width: 10,
//                                     color: AppColors.white,
//                                     toY: controller.hourlyTempModel!.list![30]
//                                             .main.temp -
//                                         273.15)
//                               ],
//                             ),
//                             BarChartGroupData(
//                               x: (controller
//                                       .hourlyTempModel!.list![36].main.temp -
//                                   273.15.toInt()),
//                               groupVertically: true,
//                               barRods: [
//                                 BarChartRodData(
//                                     width: 10,
//                                     color: AppColors.white,
//                                     toY: controller.hourlyTempModel!.list![36]
//                                             .main.temp -
//                                         273.15)
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
