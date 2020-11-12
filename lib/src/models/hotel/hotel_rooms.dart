import 'package:meta/meta.dart';

// ignore: camel_case_types
class Rooms_items {
    const Rooms_items({
        @required this.rommsitem,
    });

    final List<Findavailableroom> rommsitem;

  static Rooms_items fromJson(Map<String, dynamic> json) {
    final rommsitem = (json['findavailablerooms'] as List<dynamic>)
        .map((dynamic item) =>
            Findavailableroom.fromJson(item as Map<String, dynamic>))
        .toList();
    return Rooms_items(rommsitem: rommsitem);
  }
}

class Findavailableroom {
    Findavailableroom({
        @required this.name,
        @required this.id,
        @required this.roomNumber,
        @required this.maxOccupancy,
        @required this.reserved,
    });

    final String name;
    final String id;
    final int roomNumber;
    final int maxOccupancy;
    final List<dynamic> reserved;

    factory Findavailableroom.fromJson(Map<String, dynamic> json) => Findavailableroom(
        name: json["name"],
        id: json["id"],
        roomNumber: json["room_number"],
        maxOccupancy: json["max_occupancy"],
        reserved: List<dynamic>.from(json["reserved"].map((x) => x)),
    );

}
