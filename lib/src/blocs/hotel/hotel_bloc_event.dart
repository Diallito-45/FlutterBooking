import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HotelEvent extends Equatable {
  const HotelEvent();
}

class ValidateButtonPressed extends HotelEvent {
  final String cityId;
  final String startDate;
  final String endDate;
    // ignore: non_constant_identifier_names
  final int max_occupancy;
    // ignore: non_constant_identifier_names
  final int room_number;
  
  

  const ValidateButtonPressed({
      @required this.cityId,
      @required this.startDate,
      @required this.endDate,
      // ignore: non_constant_identifier_names
      @required this.max_occupancy,
      // ignore: non_constant_identifier_names
      @required this.room_number,
      

      // ignore: non_constant_identifier_names
      
      // ignore: non_constant_identifier_names
      }) : 
      assert(cityId != null),
      assert(startDate != null),
      assert(endDate != null),
      assert(max_occupancy != null),
      assert(room_number != null)
      ;

  @override
  List<Object> get props => [
  cityId, 
  startDate, 
  endDate, 
  max_occupancy,
  room_number, 
  ];

  @override
  String toString() => 
  'ValidateButtonPressed { cityId: $cityId, startDate: $startDate, endDate: $endDate, room_number: $room_number, max_occupancy: $max_occupancy, }';
}
