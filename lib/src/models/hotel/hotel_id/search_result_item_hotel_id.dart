// ignore: camel_case_types 
import 'package:flutter/foundation.dart';

// ignore: camel_case_types
class Search_Result_Item_Hotel_Id {
  const Search_Result_Item_Hotel_Id({
        @required this.id,
        @required this.name,
        @required this.contact,
        @required this.location,
        @required this.parking,
        @required this.option,
        @required this.imageUrl,
        @required this.price,
        @required this.rating,
        @required this.isfavoris,
        @required this.createdAt,
  });

    final String id;
    final String name;
    final int contact;
    final String location;
    final String parking;
    final List<String> option;
    final String imageUrl;
    final double price;
    final double rating;
    final bool isfavoris;
    final DateTime createdAt;

  static Search_Result_Item_Hotel_Id fromJson(dynamic json) {
    return Search_Result_Item_Hotel_Id(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        contact: json["contact"] == null ? null : json["contact"],
        location: json["location"] == null ? null : json["location"],
        parking: json["parking"] == null ? null : json["parking"],
        option: json["option"] == null ? null : List<String>.from(json["option"].map((x) => x)),
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        isfavoris: json["isfavoris"] == null ? null : json["isfavoris"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );
  }
}
