// ignore_for_file: constant_identifier_names

class HourlyTempModel {
  final List<WeatherData>? list;
  final City? city;
  HourlyTempModel({
    this.list,
    this.city,
  });

  factory HourlyTempModel.fromJson(Map<String, dynamic> json) {
    return HourlyTempModel(
      list: json['list'] != null
          ? List<WeatherData>.from(
              json['list'].map((data) => WeatherData.fromJson(data)))
          : null,
      city: City.fromJson(json['city']),
    );
  }
}

class WeatherData {
  final dynamic dt;
  final MainData main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final dynamic visibility;
  final dynamic pop;
  final Rain? rain;
  final Sys sys;
  final String dtTxt;

  WeatherData({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    this.rain,
    required this.sys,
    required this.dtTxt,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      dt: json['dt'] ?? 0,
      main: MainData.fromJson(json['main']),
      weather: json['weather'] != null
          ? List<Weather>.from(
              json['weather'].map((data) => Weather.fromJson(data)))
          : [],
      clouds: Clouds.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'] ?? 0,
      pop: json['pop'] ?? 0.0,
      rain: json.containsKey('rain') ? Rain.fromJson(json['rain']) : null,
      sys: Sys.fromJson(json['sys']),
      dtTxt: json['dt_txt'] ?? "",
    );
  }
}

class MainData {
  final dynamic temp;
  final dynamic feelsLike;
  final dynamic tempMin;
  final dynamic tempMax;
  final dynamic pressure;
  final dynamic seaLevel;
  final dynamic grndLevel;
  final dynamic humidity;
  final dynamic tempKf;

  MainData({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory MainData.fromJson(Map<String, dynamic> json) {
    return MainData(
      temp: (json['temp'] ?? 0.0).toInt(),
      feelsLike: (json['feels_like'] ?? 0.0).toInt(),
      tempMin: (json['temp_min'] ?? 0.0).toInt(),
      tempMax: (json['temp_max'] ?? 0.0).toInt(),
      pressure: json['pressure'] ?? 0,
      seaLevel: json['sea_level'] ?? 0,
      grndLevel: json['grnd_level'] ?? 0,
      humidity: json['humidity'] ?? 0,
      tempKf: (json['temp_kf'] ?? 0.0).toInt(),
    );
  }
}

class Weather {
  final dynamic id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'] ?? 0,
      main: json['main'] ?? "",
      description: json['description'] ?? "",
      icon: json['icon'] ?? "",
    );
  }
}

class Clouds {
  final dynamic all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'] ?? 0,
    );
  }
}

class Wind {
  final dynamic speed;
  final dynamic deg;
  final dynamic gust;

  Wind({required this.speed, required this.deg, required this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: (json['speed'] ?? 0.0).toInt(),
      deg: json['deg'] ?? 0,
      gust: (json['gust'] ?? 0.0).toInt(),
    );
  }
}

class Rain {
  final dynamic h3;

  Rain({this.h3});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      h3: (json['3h'] ?? 0.0).toInt(),
    );
  }
}

class Sys {
  final dynamic type;
  final dynamic id;
  final String country;
  final dynamic sunrise;
  final dynamic sunset;

  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json['type'] ?? 0,
      id: json['id'] ?? 0,
      country: json['country'] ?? "",
      sunrise: json['sunrise'] ?? 0,
      sunset: json['sunset'] ?? 0,
    );
  }
}

class City {
  final String name;

  City({required this.name});
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'] ?? "",
    );
  }
}
