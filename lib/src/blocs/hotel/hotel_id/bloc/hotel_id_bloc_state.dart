//@immutable
import 'package:equatable/equatable.dart';
import 'package:test_app/src/models/hotel/hotel_id/search_result_item_hotel_id.dart';

abstract class HotelIdBlocState extends Equatable {
  const HotelIdBlocState();

  @override
  List<Object> get props => [];
}

class HotelIdBlocInitial extends HotelIdBlocState {}

class HotelIdInloading extends HotelIdBlocState {}

class HotelIdSuceess extends HotelIdBlocState {
  final List<Search_Result_Item_Hotel_Id> items;

  HotelIdSuceess(this.items);

    @override
  List<Object> get props => [items];

    @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class HotelIdFailure extends HotelIdBlocState {
    final String error;

  const HotelIdFailure(this.error);

    @override
  List<Object> get props => [error];

    @override
  String toString() => 'fetch Hotel by Id Failure { error: $error }';



}
