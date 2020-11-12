import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:test_app/src/blocs/weather/weather_event.dart';
import 'package:test_app/src/blocs/weather/weather_state.dart';
import 'package:test_app/src/models/weather/models.dart';
import 'package:test_app/src/resources/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
      super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoadSuccess(weather: weather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
  }
}
