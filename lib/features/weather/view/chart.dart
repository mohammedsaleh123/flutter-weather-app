import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/core/app_colors.dart';
import 'package:weatherapp/features/weather/controller/repository/get_weather_repositoy.dart';

// ignore: must_be_immutable
class Chart extends StatelessWidget {
  Chart({super.key});
  GetWeatherRepository controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.offWhite,
      padding: const EdgeInsets.only(top: 12),
      height: 200,
      child: LineChart(
        LineChartData(
          maxY: 40,
          minY: 0,
          maxX: 25,
          lineBarsData: [
            LineChartBarData(
              barWidth: 3,
              isCurved: true,
              belowBarData: BarAreaData(show: true),
              dotData: const FlDotData(show: true),
              spots: [
                FlSpot(
                    5, controller.hourlyTempModel!.list![0].main.temp - 273.15),
                FlSpot(10,
                    controller.hourlyTempModel!.list![6].main.temp - 273.15),
                FlSpot(15,
                    controller.hourlyTempModel!.list![12].main.temp - 273.15),
                FlSpot(20,
                    controller.hourlyTempModel!.list![18].main.temp - 273.15),
                FlSpot(25,
                    controller.hourlyTempModel!.list![24].main.temp - 273.15),
              ],
              isStrokeCapRound: true,
              isStrokeJoinRound: false,
            ),
          ],
        ),
      ),
    );
  }
}
