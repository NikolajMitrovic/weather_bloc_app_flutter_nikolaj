import 'dart:convert';

class Weather {
  const Weather({
    required this.temperature,
    required this.weatherCode,
  });

  final double temperature;
  final double weatherCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temperature': temperature,
      'weatherCode': weatherCode,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      temperature: map['temperature'] as double,
      weatherCode: map['weatherCode'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);
}
