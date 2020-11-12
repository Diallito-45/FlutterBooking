import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/src/blocs/weather/weather_bloc.dart';
import 'package:test_app/src/resources/weather_repository.dart';
import 'package:test_app/src/widgets/weather.dart';


class WeatherSearch extends StatelessWidget {
  final WeatherRepository weatherRepository;

  WeatherSearch({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: BlocProvider(
        create: (context) =>
            WeatherBloc(weatherRepository: weatherRepository),
        child: Weather(),
      ),
    );
  }
}
