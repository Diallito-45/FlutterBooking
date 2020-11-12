import 'package:test_app/src/models/hotel/hotel_id/search_result_item_hotel_id.dart';

// ignore: camel_case_types
class SearchResult_hotel_Id {
  final List<Search_Result_Item_Hotel_Id> items;

  const SearchResult_hotel_Id({this.items});

  static SearchResult_hotel_Id fromJson(Map<String, dynamic> json) {
    final items = (json['hotel'] as List<dynamic>)
        .map((dynamic item) =>
            Search_Result_Item_Hotel_Id.fromJson(item as Map<String, dynamic>))
        .toList();
    return SearchResult_hotel_Id(items: items);
  }
}

