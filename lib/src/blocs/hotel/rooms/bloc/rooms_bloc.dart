import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app/src/blocs/hotel/rooms/bloc/rooms_barel.dart';
import 'package:test_app/src/models/search_result_error.dart';
import 'package:test_app/src/resources/hotel_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'rooms_event.dart';
import 'rooms_state.dart';
import 'package:bloc/bloc.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final HotelRepository hotelRepository;

  RoomsBloc({
    @required this.hotelRepository,
  })  : assert(hotelRepository != null),
        super(RoomsInLoading());


    @override
  Stream<Transition<RoomsEvent, RoomsState>> transformEvents(
    Stream<RoomsEvent> events,
    Stream<Transition<RoomsEvent, RoomsState>> Function(
      RoomsEvent event,
    )
        transitionFn,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  void onTransition(Transition<RoomsEvent, RoomsState> transition) {
    print(transition);
    super.onTransition(transition);
  }


  @override
  Stream<RoomsState> mapEventToState(
    RoomsEvent event,
  ) async* {
    if (event is FindAvailablreRoomsPressed) {
      yield RoomsInLoading();
      // ignore: non_constant_identifier_names
      final String hotel_id = event.hotel_id;
      final String startDate = event.startDate;
      final String endDate = event.endDate;
      // ignore: non_constant_identifier_names
      final int max_occupancy = event.max_occupancy;
      // ignore: non_constant_identifier_names
      final int room_number = event.room_number;
      try {
        final results = await hotelRepository.getavailablerooms(
            hotel_id: hotel_id,
            startDate: startDate,
            endDate: endDate,
            max_occupancy: max_occupancy,
            room_number: room_number
            );
        yield RoomsloadedSucees(results.rommsitem);
      } catch (error) {
        print(error);
        yield error is SearchResultError
            ? RoomsLoadFailure(error.message)
            : RoomsLoadFailure('une erreur est survenue $error');
      }
    }
  }
}
