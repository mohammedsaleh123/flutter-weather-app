import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/core/app_colors.dart';
import 'package:weatherapp/core/components/custom_text.dart';
import 'package:weatherapp/features/weather/controller/repository/get_weather_repositoy.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({
    super.key,
    required this.country,
    required this.minTemp,
    required this.maxTemp,
    required this.windImage,
    required this.weatherImage,
    required this.windSpeed,
    required this.temp,
  });
  final GetWeatherRepository controller = Get.find();
  final String country;
  final double minTemp;
  final double maxTemp;
  final String windImage;
  final String weatherImage;
  final String windSpeed;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetWeatherRepository>(builder: (controller) {
      return controller.currentTempModel == null
          ? Container()
          : Container(
              padding: const EdgeInsets.all(8),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(colors: [
                  AppColors.lightPrimaryColor,
                  AppColors.primaryColor,
                  AppColors.lightPrimaryColor
                ], begin: Alignment.topRight, end: Alignment.bottomLeft),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: DateFormat('yyyy MMM EEEE')
                              .format(DateTime.now()),
                          color: AppColors.offWhite,
                          fontSize: 18,
                        ),
                        const Spacer(flex: 1),
                        Center(
                          child: CustomText(
                            text: country,
                            color: AppColors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Center(
                          child: CustomText(
                            text: temp.toString(),
                            color: AppColors.white,
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        Divider(
                          color: AppColors.offWhite.withOpacity(0.5),
                          thickness: 2,
                          indent: 3,
                          endIndent: 10,
                        ),
                        const Spacer(flex: 3),
                        Row(
                          children: [
                            CustomText(
                              text:
                                  'min ${(minTemp - 273.15).toStringAsFixed(0)}°c  |  max ${(maxTemp - 273.15).toStringAsFixed(0)}°c',
                              color: AppColors.white,
                            ),
                            const Spacer(flex: 1),
                            Container(
                              child: controller.isCurrentWeather == false
                                  ? IconButton(
                                      enableFeedback: true,
                                      onPressed: () {
                                        //controller.getCurrentWeather();
                                        controller.refreshCurrentWeather();
                                      },
                                      icon: const Icon(
                                        Icons.refresh_outlined,
                                        color: AppColors.white,
                                        size: 30,
                                      ))
                                  : Container(),
                            ),
                            const Spacer(flex: 1),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                            child: Image.asset(
                          weatherImage,
                          height: 50,
                        )),
                        Image.asset(windImage),
                        CustomText(
                          text: windSpeed,
                          color: AppColors.offWhite,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
