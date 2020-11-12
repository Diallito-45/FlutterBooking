import "package:graphql_flutter/graphql_flutter.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/src/models/hotel/hotel_id/search_result_hotel_id.dart';
import 'package:test_app/src/models/hotel/search_result_hotel.dart';
import 'package:test_app/src/models/search_result.dart';
import 'package:test_app/src/models/search_result_error.dart';
import 'package:test_app/src/resources/graphqlconfig.dart';
import 'package:test_app/src/resources/query.dart';
import 'package:test_app/src/models/hotel/hotel_rooms.dart';


class UserRepository {
  String token;
  bool succes = false;

  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation queryMutation = QueryMutation();

  Future<SearchResult> search(String term) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(
          queryMutation.searche(
            term,
          ),
        ),
      ),
    );
    final results = result.data;

    if (result.hasException) {
      succes = false;
      throw SearchResultError.fromJson(results);
    }
    return SearchResult.fromJson(results);
  }

  Future<SearchResult_hotel_Id> findhotelbyId(String hotelid) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(
          queryMutation.findhotelbyId(
            hotelid,
          ),
        ),
      ),
    );
    final results = result.data;

    if (result.hasException) {
      succes = false;
      throw SearchResultError.fromJson(results);
    }
    return SearchResult_hotel_Id.fromJson(results);
  }

  Future<Rooms_items> availablerooms({ 
      // ignore: non_constant_identifier_names
      String hotel_id,
      String startDate,
      String endDate,
      // ignore: non_constant_identifier_names
      int max_occupancy,
      // ignore: non_constant_identifier_names
      int room_number,
      }) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(
          queryMutation.findavailableromms(
            hotel_id,
            startDate,
            endDate,
            max_occupancy,
            room_number,
          ),
        ),
      ),
    );

    final hotelJson = (result.data);

    if (result.hasException) {
      succes = false;
      throw SearchResultError.fromJson(hotelJson);
    }
    return Rooms_items.fromJson(hotelJson);
  }


    Future<Rooms_items> bookRooms({ 
      // ignore: non_constant_identifier_names
      List<String> romsid,
      String from,
      String to
      }) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.mutate(
      MutationOptions(
        documentNode: gql(
          queryMutation.bookRomms(
            romsid,
            from,
            to
          ),
        ),
      ),
    );

    final hotelJson = (result.data);

    if (result.hasException) {
      succes = false;
      throw SearchResultError.fromJson(hotelJson);
    }
    return Rooms_items.fromJson(hotelJson);
  }

  // ignore: non_constant_identifier_names
  Future<SearchResult_hotel> findHotel({ 
      String city,
      String startDate,
      String endDate,
      int max_occupancy,
      // ignore: non_constant_identifier_names
      int room_number,
      // ignore: non_constant_identifier_names
      

      }) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(
          queryMutation.hotelsearch(
            city,
            startDate,
            endDate,
            max_occupancy,
            room_number,
          ),
        ),
      ),
    );

    final hotelJson = (result.data);

    if (result.hasException) {
      succes = false;
      throw SearchResultError.fromJson(hotelJson);
    }
    return SearchResult_hotel.fromJson(hotelJson);
  }

  Future<String> authenticate({String email, String password}) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(
          queryMutation.signInUser(
            email,
            password,
          ),
        ),
      ),
    );
    if (result.hasException) {
      throw Exception("email ou mot de pass incorrect");
    }
    succes = true;
    token = result.data['login']['jwt'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print(token);
    return token;
  }

  Future<String> signUp({String email, String password}) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.mutate(
      MutationOptions(
        onCompleted: (dynamic resultData) {
          return resultData;
          //print(resultData);
        },
        documentNode: gql(
          queryMutation.signUpUser(
            email,
            password,
          ),
        ),
      ),
    );
    if (result.hasException) {
      throw Exception();
    }
    succes = true;
    String id = result.data['signup']['id'];
    return id;
  }

  Future<bool> isSignedIn() async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryMutation.getcurrentUser()),
      ),
    );
    if (result.hasException) {
      throw Exception();
    }
    return result.data != null;
  }

  Future<String> getUser() async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryMutation.getcurrentUser()),
      ),
    );
    if (result.hasException) {
      throw Exception();
    }
    succes = true;
    String email = result.data['user']['email'];
    return email;
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    if (!succes) {
      throw ("some arbitrary error");
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print(token);
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    if (token != null) {
      print(token);
      return true;
    }
    return false;
  }
}
