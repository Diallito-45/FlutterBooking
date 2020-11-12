import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

//@immutable
abstract class HotelIdBlocEvent extends Equatable{
  const HotelIdBlocEvent();
}

class HotelSelected extends HotelIdBlocEvent {
  final String hotelId;

  const HotelSelected({
    @required this.hotelId
  }) : assert (hotelId != null);

  @override
  // TODO: implement props
  List<Object> get props => [hotelId];

  @override
  String toString() => 
  'HotelSelected { hotelid: $hotelId}';
}