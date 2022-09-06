import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/weather.dart';

class HttpHelper {
  //http://api.openweathermap.org/data/2.5/weather?q=Rome&appid=a657743673a5c8c435ee16e882e97d66

  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'a657743673a5c8c435ee16e882e97d66';

  //Future method to perform asynchronous task
  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}