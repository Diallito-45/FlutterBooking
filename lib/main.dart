import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/src/blocs/login/AuthenticationBloc.dart';
import 'package:test_app/src/blocs/login/AuthenticationEvent.dart';
import 'package:test_app/src/blocs/weather/simple_bloc_observer.dart';
import 'package:test_app/src/models/github_cache.dart';
import 'package:test_app/src/models/github_repository.dart';
import 'package:test_app/src/resources/UserRepository.dart';
import 'package:test_app/src/resources/hotel_repository.dart';
import 'package:test_app/src/resources/weather_api_client.dart';
import 'package:test_app/src/resources/weather_repository.dart';
import 'src/app.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  final userRepository = UserRepository();
  final HotelRepository _hotelRepository = HotelRepository(
    UserRepository()
  );
  final GithubRepository _githubRepository = GithubRepository(
    GithubCache(),
    UserRepository(),
  );
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );
  return runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AuthenticationStarted());
      },
      child: App(
          hotelRepository: _hotelRepository,
          weatherRepository: weatherRepository,
          userRepository: userRepository,
          githubRepository: _githubRepository
      ),
    ),
  );
}
