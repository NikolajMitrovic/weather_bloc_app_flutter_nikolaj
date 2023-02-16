// import 'package:weather_bloc_app/_all.dart';

abstract class WeatherEvent {}

class WeatherLoadEvent extends WeatherEvent {
  String city;

  WeatherLoadEvent({
    required this.city,
  });
}
