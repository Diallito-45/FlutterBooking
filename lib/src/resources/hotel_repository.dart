import 'dart:async';
import 'package:test_app/src/models/hotel/hotel_id/search_result_hotel_id.dart';
import 'package:test_app/src/models/hotel/search_result_hotel.dart';
import 'package:test_app/src/resources/UserRepository.dart';
import 'package:test_app/src/models/hotel/hotel_rooms.dart';


class HotelRepository {
  final UserRepository userRepository;

  HotelRepository( this.userRepository)
      : assert(userRepository != null);

  Future<SearchResult_hotel> getHotel({ 
      String city,
      String startDate,
      String endDate,
      // ignore: non_constant_identifier_names
      int max_occupancy,
      // ignore: non_constant_identifier_names
      int room_number
      }) async {
    return userRepository.findHotel(
        city: city,
        startDate: startDate, 
        endDate: endDate,
        max_occupancy: max_occupancy,
        room_number: room_number,
        );
  }

  Future<Rooms_items> getavailablerooms({ 
      // ignore: non_constant_identifier_names
      String hotel_id,
      String startDate,
      String endDate,
      // ignore: non_constant_identifier_names
      int max_occupancy,
      // ignore: non_constant_identifier_names
      int room_number
      }) async {
    return userRepository.availablerooms(
        hotel_id: hotel_id,
        startDate: startDate, 
        endDate: endDate,
        max_occupancy: max_occupancy,
        room_number: room_number,
        );
  }

  Future<SearchResult_hotel_Id> findhotelbyId(String hotelId) async {
      final result = await userRepository.findhotelbyId(hotelId);
      return result;
    }
}
