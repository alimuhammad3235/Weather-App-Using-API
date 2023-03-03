/*
                          

{
  "weather": [
    {
      "description": "moderate rain",
      "icon": "10d"
    }
  ],
   "timezone": 18000,
   "main": {
        "temp": 304.05,
        "feels_like": 302.4,
        "temp_min": 304.05,
        "temp_max": 304.05,
        "pressure": 1016,
        "humidity": 25
    },
    "visibility": 3000,
    "wind": {
        "speed": 3.6,
        "deg": 210
    },
  "main": {
    "temp": 298.48,
  },
  "name": "Zocca",
}                                               
*/

import 'package:flutter/cupertino.dart';

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});
  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];

    return TemperatureInfo(temperature: temperature);
  }
}

class humidityWeather {
  final int humidity;
  humidityWeather({required this.humidity});
  factory humidityWeather.fromJson(Map<String, dynamic> json) {
    final int humidity = json['humidity'];

    return humidityWeather(humidity: humidity);
  }
}

class PressureWeather {
  final int pressure;
  PressureWeather({required this.pressure});
  factory PressureWeather.fromJson(Map<String, dynamic> json) {
    final int pressure = json['pressure'];

    return PressureWeather(pressure: pressure);
  }
}

class WeatherInfo {
  final String description;
  final String icon;
  WeatherInfo({required this.description, required this.icon});
  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class WeatherResponse {
  final String cityName;
  final int visibility;
  final int timezone;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;
  final humidityWeather humidityinfo;
  final PressureWeather pressureInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse(
      {required this.visibility,
      required this.cityName,
      required this.tempInfo,
      required this.weatherInfo,
      required this.humidityinfo,
      required this.pressureInfo,
      required this.timezone});
  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final visibility = json['visibility'];
    final timezone = json['timezone'];
    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);
    final humidityInfo = humidityWeather.fromJson(tempInfoJson);
    final pressureInfo = PressureWeather.fromJson(tempInfoJson);

    final WeatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(WeatherInfoJson);
    return WeatherResponse(
        timezone: timezone,
        visibility: visibility,
        cityName: cityName,
        tempInfo: tempInfo,
        weatherInfo: weatherInfo,
        humidityinfo: humidityInfo,
        pressureInfo: pressureInfo);
  }
}
