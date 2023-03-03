import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/user_model.dart';

class DataServices {
  Future<WeatherResponse> getweather(String city) async {
    //https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=f5783e1fee68d6228723ecc46804ee40
    final queryParameter = {
      'q': city,
      'appid': 'f5783e1fee68d6228723ecc46804ee40',
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameter);
    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
