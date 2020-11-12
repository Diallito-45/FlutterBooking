import 'dart:async';

import 'package:test_app/src/models/github_cache.dart';
import 'package:test_app/src/models/search_result.dart';
import 'package:test_app/src/resources/UserRepository.dart';

class GithubRepository {
  
  final GithubCache cache;
  final UserRepository client;

  GithubRepository(this.cache, this.client);

  Future<SearchResult> search(String term) async {
    if (cache.contains(term)) {
      return cache.get(term);
    } else {
      final result = await client.search(term);
      cache.set(term, result);
      return result;
    }
  }
}
