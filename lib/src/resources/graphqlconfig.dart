import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:shared_preferences/shared_preferences.dart';

class GraphQLConfiguration {
  //static String token;
  static HttpLink httpLink = HttpLink(uri: 'http://192.168.43.72:4000/graphql'
      // headers: {'Content-Type': 'application/json',}
      );

  //Provide authentication, this will go as a Header in Request
  static final AuthLink authLink = AuthLink(getToken: () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    return token;
  });

  static final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  // Create a common client for further requests
  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: link,
    );
  }
}
