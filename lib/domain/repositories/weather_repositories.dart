import 'package:weather_bloc_app/_all.dart';

abstract class IWeatherRepository {
  Future<Location?> getLocation(String city);
  Future<Weather?> getWeather(Location location);
}

class WeatherRepository implements IWeatherRepository {
  @override
  Future<Weather?> getWeather(Location location) async {
    const result = Weather(temperature: 12.4, weatherCode: 1.0);
    return result;
  }

  @override
  Future<Location?> getLocation(String city) async {
    const result = Location(id: 2, name: 'Mostar', latitude: 121212, longitude: 212434);
    return result;
  }
}

