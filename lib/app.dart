import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/bloc/weather_bloc.dart';
import 'package:weather_bloc_app/bloc/weather_event.dart';
// import 'package:weather_bloc_app/search/view/search.dart';
import 'package:weather_bloc_app/search/view/settings.dart';

import 'bloc/weather_state.dart';
import 'domain/repositories/weather_repositories.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required WeatherRepository weatherRepository,
  }) : _weatherRepository = weatherRepository;

  final WeatherRepository _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider.value(
        value: _weatherRepository,
        child: const WeatherScreen(),
      ),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
        weatherRepository: context.read<WeatherRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Row(
              children: [
                // IconButton(
                //   onPressed: () {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(builder: (_) => const SearchPage()),
                //     );
                //   },
                //   icon: const Icon(Icons.search),
                //   splashRadius: 20,
                // ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SettingsPage()),
                    );
                  },
                  icon: const Icon(Icons.settings),
                  splashRadius: 20,
                ),
              ],
            ),
          ],
          title: const Text('Weather App'),
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, weatherState) {
            if (weatherState.status == WeatherStateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            DateTime now = DateTime.now();
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.shade900,
                      Colors.blue.shade900.withOpacity(0.8),
                      Colors.blue.shade900.withOpacity(0.4),
                      Colors.blue.withOpacity(0.1),
                    ],
                  ),
                ),
                child: Column(
                  children: [
//
// lista = [COFFEEMODEL, COFFEEMODEL, COFFEEMODEL, COFFEEMODEL, ]
//
//
//
//
//
// ListView.builder(
//  itemcount: lista.length,
//   itemBuilder: (context, index){
// return Container(
//  child: Column(
// Text(list[index].title),
// Text(list[index].desc),
// Text(list[index].imagelink),
// Text(list[index].price),
//
// )
// )
//
// },
// ),

                    const SizedBox(
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onSubmitted: (value) => context.read<WeatherBloc>().add(WeatherLoadEvent(city: value)),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: 'Search City',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        weatherState.location?.name ?? 'City Name',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Updated: $now',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.cloudy_snowing,
                            size: 100,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            weatherState.weather?.temperature.toString() ?? 'Temperature',
                            style: const TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Temperature info',
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Temperature info',
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Weather Description',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
