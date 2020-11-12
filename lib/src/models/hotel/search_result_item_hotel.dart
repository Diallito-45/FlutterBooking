// ignore: camel_case_types
class Search_Result_Item_Hotel {
  const Search_Result_Item_Hotel({
        this.id,
        this.name,
        this.contact,
        this.city,
        this.location,
        this.parking,
        this.breakfast,
        this.option,
        this.imageListUrl,
        this.imageUrl,
        this.price,
        this.rating,
        this.isfavoris,
        this.createdAt,
  });

    final String id;
    final String name;
    final int contact;
    final City city;
    final String location;
    final String parking;
    final String breakfast;
    final List<Option> option;
    final List<String> imageListUrl;
    final String imageUrl;
    final double price;
    final double rating;
    final bool isfavoris;
    final DateTime createdAt;

  static Search_Result_Item_Hotel fromJson(dynamic json) {
    return Search_Result_Item_Hotel(
        id: json["id"],
        name: json["name"],
        contact: json["contact"],
        city: City.fromJson(json["city"]),
        location: json["location"],
        parking: json["parking"],
        breakfast: json["breakfast"],
        option: List<Option>.from(json["option"].map((x) => optionValues.map[x])),
        imageListUrl: List<String>.from(json["imageList_Url"].map((x) => x)),
        imageUrl: json["imageUrl"],
        price: json["price"].toDouble(),
        rating: json["rating"].toDouble(),
        isfavoris: json["isfavoris"],
        createdAt: DateTime.parse(json["createdAt"]),    );
  }
}

class City {
    City({
        this.id,
        this.name,
    });

    final String id;
    final String name;

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

enum Option { GARAGE_GRATUIT, ENFANT_AUTORISER }

final optionValues = EnumValues({
    "enfant autoriser": Option.ENFANT_AUTORISER,
    "garage gratuit": Option.GARAGE_GRATUIT
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
  }