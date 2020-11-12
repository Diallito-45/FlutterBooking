import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_app/src/models/search_result_error.dart';
import 'package:test_app/src/resources/hotel_repository.dart';
import 'hotel_bloc_event.dart';
import 'hotel_bloc_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelRepository hotelRepository;

  HotelBloc({
    @required this.hotelRepository,
  })  : assert(hotelRepository != null),
        super(HotelLoadInProgress());

  @override
  Stream<Transition<HotelEvent, HotelState>> transformEvents(
    Stream<HotelEvent> events,
    Stream<Transition<HotelEvent, HotelState>> Function(
      HotelEvent event,
    )
        transitionFn,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  void onTransition(Transition<HotelEvent, HotelState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<HotelState> mapEventToState(
    HotelEvent event,
  ) async* {
    if (event is ValidateButtonPressed) {
      yield HotelLoadInProgress();
      final String city = event.cityId;
      final String startDate = event.startDate;
      final String endDate = event.endDate;
      // ignore: non_constant_identifier_names
      final int max_occupancy = event.max_occupancy;
      // ignore: non_constant_identifier_names
      final int room_number = event.room_number;
      try {
        final results = await hotelRepository.getHotel(
            city: city,
            startDate: startDate,
            endDate: endDate,
            max_occupancy: max_occupancy,
            room_number: room_number
            );
        yield HotelLoadSuccess(results.items);
      } catch (error) {
        print(error);
        yield error is SearchResultError
            ? HotelLoadFailure(error.message)
            : HotelLoadFailure('une erreur est survenue $error');
      }
    }
  }
}
