// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/core/app_assets.dart';
import 'package:weatherapp/features/weather/model/current_temp_model.dart';
import 'package:weatherapp/features/weather/model/hourly_temp_model.dart';
import 'package:weatherapp/features/weather/model/temp_model.dart';
import 'package:weatherapp/features/weather/controller/repository/location_service.dart';

class GetWeatherRepository extends GetxController {
  TempModel? tempModel;
  TextEditingController searchController = TextEditingController();
  HourlyTempModel? hourlyTempModel;
  CurrentTempModel? currentTempModel;
  String apiKey = "06c921750b9a82d8f5d1294e1586276f";
  String baseUrl = "https://api.openweathermap.org/data/2.5";
  bool isCurrentLocation = true;
  String? country;
  String? sity;
  bool isSearch = false;
  bool isCurrentWeather = true;

//https://api.openweathermap.org/data/2.5/weather?lat=31.3041836&lon=30.0599353&appid=06c921750b9a82d8f5d1294e1586276f
  @override
  void onInit() {
    LocationService().determinePosition();
    LocationService().getLocation();
    getCurrentWeather();
    getWeather();
    initialCountry();
    super.onInit();
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void onReady() {
  //   refreshCurrentWeather();
  //   super.onReady();
  // }

  getWeather() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/weather?q=$country&appid=$apiKey'),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        tempModel = TempModel.fromJson(jsonData);
        update();
      } else {
        //Get.snackbar('error', 'error', backgroundColor: AppColors.white);
      }
    } catch (e) {
      //Get.snackbar('error', e.toString(), backgroundColor: AppColors.white);
    }
  }

  getCurrentWeather() async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/weather?lat=31.3041836&lon=30.0599353&appid=$apiKey'),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        currentTempModel = CurrentTempModel.fromJson(jsonData);
        update();
      } else {
        //Get.snackbar('error', 'error', backgroundColor: AppColors.white);
      }
    } catch (e) {
      //Get.snackbar('error', e.toString(), backgroundColor: AppColors.white);
    }
  }

  getHourlyWeather() async {
    sity = currentTempModel?.name ?? tempModel?.name ?? 'Cairo';
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/forecast?q=$sity&appid=$apiKey'),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        hourlyTempModel = HourlyTempModel.fromJson(jsonData);
        update();
      } else {
        //Get.snackbar('error', 'error', backgroundColor: AppColors.white);
      }
    } catch (e) {
      //Get.snackbar('error', e.toString(), backgroundColor: AppColors.white);
    }
  }

  String switchWeatherImageCases(String cases) {
    switch (cases) {
      case 'light rain':
        return Assets.assetsImagesSunRaint;
      case 'clear sky':
        return Assets.assetsImagesSun;
      case 'fey cloud':
        return Assets.assetsImagesStart;
      case 'overcast clouds':
        return Assets.assetsImagesSunHeavyRain;
      case 'moderate rain':
        return Assets.assetsImagesSunSlowRain;
    }
    return Assets.assetsImagesSun;
  }

  countrySearch(String searchCity) {
    sity = searchCity;
    isSearch = true;
    isCurrentWeather = false;
    sity = searchCity;
    getHourlyWeather();
    searchController.clear();
    update();
  }

  initialCountry() async {
    sity = currentTempModel?.name;
    //update();
  }

  refreshCurrentWeather() {
    tempModel = null;
    isSearch = false;
    isCurrentWeather = true;
    country = currentTempModel!.name;
    getHourlyWeather();

    update();
  }
}
//https://api.openweathermap.org/data/2.5/forecast?q=london&appid=06c921750b9a82d8f5d1294e1586276f

