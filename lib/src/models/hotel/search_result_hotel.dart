import 'package:test_app/src/models/hotel/search_result_item_hotel.dart';

// ignore: camel_case_types
class SearchResult_hotel {
  final List<Search_Result_Item_Hotel> items;

  const SearchResult_hotel({this.items});

  static SearchResult_hotel fromJson(Map<String, dynamic> json) {
    final items = (json['findhotel'] as List<dynamic>)
        .map((dynamic item) =>
            Search_Result_Item_Hotel.fromJson(item as Map<String, dynamic>))
        .toList();
    return SearchResult_hotel(items: items);
  }
}



