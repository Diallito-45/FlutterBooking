import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RoomsEvent extends Equatable {
  const RoomsEvent();
}

class FindAvailablreRoomsPressed extends RoomsEvent {
  // ignore: non_constant_identifier_names
  final String hotel_id;
  final String startDate;
  final String endDate;
    // ignore: non_constant_identifier_names
  final int max_occupancy;
    // ignore: non_constant_identifier_names
  final int room_number;
  
  

  const FindAvailablreRoomsPressed({
      // ignore: non_constant_identifier_names
      @required this.hotel_id,
      @required this.startDate,
      @required this.endDate,
      // ignore: non_constant_identifier_names
      @required this.max_occupancy,
      // ignore: non_constant_identifier_names
      @required this.room_number,
      }) : 
      assert(hotel_id != null),
      assert(startDate != null),
      assert(endDate != null),
      assert(max_occupancy != null),
      assert(room_number != null)
      ;

  @override
  List<Object> get props => [
  hotel_id, 
  startDate, 
  endDate, 
  max_occupancy,
  room_number, 
  ];

  @override
  String toString() => 
  'FindAvailablreRoomsPressed { hotel_id: $hotel_id, startDate: $startDate, endDate: $endDate, room_number: $room_number, max_occupancy: $max_occupancy, }';
}
