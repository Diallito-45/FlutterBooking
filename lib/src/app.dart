import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:test_app/src/blocs/hotel/hotel_bloc_bloc.dart';
import 'package:test_app/src/blocs/hotel/rooms/bloc/rooms_barel.dart';
import 'package:test_app/src/blocs/search/github_search_bloc.dart';
import 'package:test_app/src/blocs/weather/weather_bloc.dart';
import 'package:test_app/src/models/github_repository.dart';
import 'package:test_app/src/resources/graphqlconfig.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_app/src/resources/UserRepository.dart';
import 'package:test_app/src/resources/hotel_repository.dart';
import 'package:test_app/src/resources/weather_repository.dart';
import 'package:test_app/src/utils/bottomNavControl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_app/src/utils/colors.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;
  final UserRepository userRepository;
  final GithubRepository githubRepository;
  final HotelRepository hotelRepository;
  const App(
      {Key key,
      this.userRepository,
      this.githubRepository,
      this.weatherRepository, 
      this.hotelRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphQLConfiguration.client,
      child: CacheProvider(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<GithubSearchBloc>(
              create: (BuildContext context) =>
                  GithubSearchBloc(githubRepository: githubRepository),
            ),
            BlocProvider<HotelBloc>(
              create: (BuildContext context) =>
                  HotelBloc(hotelRepository: hotelRepository),
            ),
            BlocProvider<WeatherBloc>(
              create: (BuildContext context) =>
                  WeatherBloc(weatherRepository: weatherRepository),
            ),
            BlocProvider<RoomsBloc>(
              create: (BuildContext context) =>
                  RoomsBloc(hotelRepository: hotelRepository),
              )
          ],
          child: MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', ''),
              const Locale('fr', ''),
            ],
            title: 'Tootep Voyage',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryColor: Color(0xFF3EBACE),
              accentColor: cyanAcent400,
              scaffoldBackgroundColor: Color(0xFFF3F5F7),
            ),
            home: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
