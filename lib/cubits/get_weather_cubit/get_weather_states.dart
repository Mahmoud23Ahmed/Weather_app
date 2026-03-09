import 'package:weather_app/models/wether_model.dart';

class GetWeatherState {}

class IntialState extends GetWeatherState {}

class WeatherLoadedState extends GetWeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailedState extends GetWeatherState {
  final String errorMessage;
  WeatherFailedState(this.errorMessage);
}
