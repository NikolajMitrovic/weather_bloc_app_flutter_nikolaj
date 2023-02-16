import 'package:weather_bloc_app/_all.dart';

enum WeatherStateStatus {
  initial,
  loading,
  loaded,
}

class WeatherState {
  WeatherStateStatus status;
  Weather? weather;
  Location? location;
  WeatherState({
    required this.status,
    this.weather,
    this.location,
  });

  WeatherState copyWith({
    WeatherStateStatus? status,
    Weather? weather,
    Location? location,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      location: location ?? this.location,
    );
  }
}
