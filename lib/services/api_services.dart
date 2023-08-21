import 'package:http/http.dart' as http;
import 'package:weather_app_2/services/current_weather.dart';
import 'package:weather_app_2/services/hour_weather.dart';
import 'package:weather_app_2/utils/const/strings.dart';

// Current Temperature
getCurrentWeather(lat, long) async {
  var link =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = currentWeatherDataFromJson(res.body.toString());
    return data;
  }
}

// Hour Temperature
gethourWeather(lat, long) async {
  var hour =
      "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(hour));
  if (res.statusCode == 200) {
    var data = hourlyWeatherDataFromJson(res.body.toString());
    return data;
  }
}
