import 'package:equatable/equatable.dart';
import 'package:test_app/src/models/hotel/search_result_item_hotel.dart';


abstract class HotelState extends Equatable {
  const HotelState();

  @override
  List<Object> get props => [];
}

class HotelInitial extends HotelState {}

class HotelLoadInProgress extends HotelState {}

class HotelLoadSuccess extends HotelState {
  final List<Search_Result_Item_Hotel> items;

  const HotelLoadSuccess(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class HotelLoadFailure extends HotelState {
  final String error;

  const HotelLoadFailure( this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'fetch Hotel Failure { error: $error }';
}
