import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/core/app_colors.dart';
import 'package:weatherapp/core/components/custom_text.dart';
import 'package:weatherapp/features/weather/controller/repository/get_weather_repositoy.dart';

// ignore: must_be_immutable
class ListHourWidget extends StatelessWidget {
  ListHourWidget({super.key});
  GetWeatherRepository controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetWeatherRepository>(builder: (controller) {
      return SizedBox(
        height: 250,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.hourlyTempModel!.list!.length,
            itemBuilder: (context, index) {
              return controller.hourlyTempModel == null
                  ? Container()
                  : Container(
                      height: 60,
                      width: 120,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.lightPrimaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(controller.switchWeatherImageCases(
                              controller.hourlyTempModel!.list![index]
                                  .weather[0].description)),
                          CustomText(
                            text: controller.hourlyTempModel!.list![index]
                                .weather[0].description,
                            color: AppColors.white,
                            textAlign: TextAlign.center,
                          ),
                          CustomText(
                            text: DateFormat('EE HH:mm').format(DateTime.parse(
                                controller
                                    .hourlyTempModel!.list![index].dtTxt)),
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            text:
                                '${(controller.hourlyTempModel!.list![index].main.temp - 273.15).toStringAsFixed(0)} °c',
                            color: AppColors.white,
                          ),
                          CustomText(
                            text: controller.hourlyTempModel!.city!.name,
                            color: AppColors.white,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    );
            }),
      );
    });
  }
}
