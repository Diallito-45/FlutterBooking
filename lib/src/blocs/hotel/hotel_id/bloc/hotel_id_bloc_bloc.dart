import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:test_app/src/models/search_result_error.dart';
import 'hotel_id_bloc_event.dart';
import 'hotel_id_bloc_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/src/resources/hotel_repository.dart';


class HotelIdBlocBloc extends Bloc<HotelIdBlocEvent, HotelIdBlocState> {
  final HotelRepository hotelRepository;

  HotelIdBlocBloc({@required this.hotelRepository,
  })  : assert(hotelRepository != null),
        super(HotelIdInloading());

  
    @override
  Stream<Transition<HotelIdBlocEvent, HotelIdBlocState>> transformEvents(
    Stream<HotelIdBlocEvent> events,
    Stream<Transition<HotelIdBlocEvent, HotelIdBlocState>> Function(
      HotelIdBlocEvent event,
    )
        transitionFn,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

    @override
  void onTransition(Transition<HotelIdBlocEvent, HotelIdBlocState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<HotelIdBlocState> mapEventToState(
    HotelIdBlocEvent event,
  ) async* {
    if (event is HotelSelected) {
      yield HotelIdInloading();
      final String hotelId = event.hotelId;
      try {
        final results = await hotelRepository.findhotelbyId(hotelId);
        yield HotelIdSuceess(results.items);
      } catch (error) {
        print(error);
        yield error is SearchResultError
            ? HotelIdFailure(error.message)
            : HotelIdFailure('une erreur est survenue $error');
      }
    }
  }
}
