import 'package:dio/dio.dart';
import 'package:weather_app/models/wether_model.dart';

class WeatherService {
  WeatherService(this.dio);
  Dio dio = Dio();

  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=bbd1c80e0bfb4cc688f171239260703&q=$cityName&days=1',
      );
      WeatherModel wetherModel = WeatherModel.fromJson(response.data);
      return wetherModel;
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data['error']['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
  }
}
