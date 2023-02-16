import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/bloc/_all.dart';
import 'package:weather_bloc_app/bloc/weather_event.dart';
import 'package:weather_bloc_app/bloc/weather_state.dart';
// import '_all.dart';
// import '../../app.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, weatherState) {
        if (weatherState.status == WeatherStateStatus.loaded) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  onSubmitted: (value) => context.read<WeatherBloc>().add(WeatherLoadEvent(city: value)),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search City',
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
        ),
      ),
    );
  }
}
