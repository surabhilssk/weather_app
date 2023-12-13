import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../models/weatherData.dart';

Future<WeatherData> getWeather({required cityName}) async {
  //parsing the url in Uri
  final url = Uri.parse("$baseUrl&appid=$apiKey&q=$cityName&units=metric");
  //waiting for response from the api or fetching data from api
  final response = await http.get(url);
  //if the data is obtained then returning the data
  if (response.statusCode == 200) {
    //decoding the json data to dart objects
    final data = jsonDecode(response.body);
    //changing the dart objects into classes
    final weatherInfo = WeatherData.fromJson(data);
    //returing the weather data
    return weatherInfo;
  } else {
    throw Exception("Failed to load weather data");
  }
}
