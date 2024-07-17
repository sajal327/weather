// import 'dart:convert';

// import 'package:weather/Model/weathermodel.dart';
// import 'package:weather/Widgets/constant.dart';
// import 'package:http/http.dart' as http;

// class WeatherApi {
//   final String baseUrl = "http://api.weatherapi.com/v1/current.json";

//   Future<ApiResponse> getCurrentWeather(String location) async {
//     String apiUrl = "$baseUrl?key=$apiKey&q=$location";
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//       if (response.statusCode == 200) {
//         // print(response.body);
//         return ApiResponse.fromJson(jsonDecode(response.body));
//       } else {
//         throw Exception("Failed to load weather");
//       }
//     } catch (e) {
//       throw Exception("Failed to load weather");
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/models/weatherModel.dart';

class WeatherApi {
  final String baseUrl = "http://api.weatherapi.com/v1/current.json";

  Future<ApiResponse> getCurrentWeather(String location) async {
    String apiUrl = "$baseUrl?key=$apiKey&q=$location";
    //print(apiUrl);
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load weather data with status code");
      }
    } catch (e) {
      throw Exception("Failed to load weather data: ");
    }
  }
}
