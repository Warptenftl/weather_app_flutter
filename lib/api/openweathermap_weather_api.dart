
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/weather_api.dart';
import 'package:weather_app/models/forecast.dart';
import 'dart:developer';

import 'package:weather_app/models/location.dart';

class OpenWeatherMapWeatherApi extends WeatherApi {
  static const endPointUrl = 'https://api.openweathermap.org/data/2.5';
  static const apiKey = "55e04530f8ec8dea3c6b8aacc2baa2c6";
  http.Client httpClient;

  OpenWeatherMapWeatherApi() {
    this.httpClient = new http.Client();
  }

  Future<Location> getLocation(String city) async {
    final requestUrl = '$endPointUrl/weather?q=$city&APPID=$apiKey';
    final response = await this.httpClient.get(Uri.encodeFull(requestUrl));

    if (response.statusCode != 200) {
      throw Exception(
          'error retrieving location for city $city: ${response.statusCode}');
    }

    return Location.fromJson(jsonDecode(response.body));
  }

  @override
  Future<Forecast> getWeather(Location location) async {
    final requestUrl =
        '$endPointUrl/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&APPID=$apiKey';
    final response = await this.httpClient.get(Uri.encodeFull(requestUrl));

    if (response.statusCode != 200) {
      throw Exception('error retrieving weather: ${response.statusCode}');
    }

    return Forecast.fromJson(jsonDecode(response.body));
  }
}