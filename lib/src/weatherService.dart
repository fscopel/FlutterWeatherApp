import 'dart:convert';
import 'models/currentWeather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<CurrentWeather> getWeatherByZipCode(String zipCode) async {
    CurrentWeather currentWeather = CurrentWeather();
    String weatherApiKey = 'ebfe94511340dbc203bc2746c491c42c';

    var client = http.Client();
    var uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?zip=$zipCode&appid=$weatherApiKey');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      currentWeather = CurrentWeather.fromJson(jsonDecode(response.body));
    }

    return currentWeather;
  }
}
