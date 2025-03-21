import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather_model.dart';

class WeatherServices {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          // "https://api.openweathermap.org/data/2.5/weather?lat=28.5175&lon=81.7787&appid=509079b22fae7e954dff8403ef5eba0e"
          // "https://api.openweathermap.org/data/2.5/weather?lat=28.5175&lon=81.7787&appid=eba908e29578a99f8810dc3238ae0b84"
          "https://api.openweathermap.org/data/2.5/weather?lat=21.0285&lon=105.8542&appid=eba908e29578a99f8810dc3238ae0b84"

      ),
    );
    // now we can cange latitude and longitude and let's see how it perfrom.
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load Weather data: ${response.statusCode}');
      }
    } catch (e) {
       // ignore: avoid_print
       print('Error: ${e.toString()}');
      return null; // Trả về null nếu có lỗi
    }
  }
}
// replace the api key with your api key thay openWeathemap provide you
// for your current location provide the longitude and latitude of your current location