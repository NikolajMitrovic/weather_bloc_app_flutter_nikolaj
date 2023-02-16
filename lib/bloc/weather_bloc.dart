// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_bloc_app/bloc/weather_event.dart';
import 'package:weather_bloc_app/bloc/weather_state.dart';
import 'package:weather_bloc_app/domain/repositories/weather_repositories.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  IWeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(initialState()) {
    on<WeatherLoadEvent>(_load);
  }

  Future<void> _load(WeatherLoadEvent event, Emitter<WeatherState> emit) async {
    emit(
      state.copyWith(
        status: WeatherStateStatus.loading,
      ),
    );

    final cityLocationResult = await weatherRepository.getLocation(event.city);
    if (cityLocationResult != null) {
      emit(
        state.copyWith(
          location: cityLocationResult,
        ),
      );
      final result = await weatherRepository.getWeather(cityLocationResult);
      await Future.delayed(const Duration(seconds: 2));
      if (result != null) {
        emit(
          state.copyWith(
            status: WeatherStateStatus.loaded,
            weather: result,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: WeatherStateStatus.loaded,
          ),
        );
      }
    } else {}
  }

  static WeatherState initialState() => WeatherState(status: WeatherStateStatus.initial);
}
