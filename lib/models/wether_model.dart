class WeatherModel {
  final String CityName;
  final DateTime date;
  final String? img;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String condition;

  WeatherModel({
    required this.CityName,
    required this.date,
    this.img,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      CityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'].toDouble(),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c']
          .toDouble(),
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c']
          .toDouble(),
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      img: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
