import 'package:weather_bloc_app/_all.dart';
import 'package:weather_bloc_app/domain/repositories/weather_repositories.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    App(
      weatherRepository: WeatherRepository(),
    ),
  );
}
