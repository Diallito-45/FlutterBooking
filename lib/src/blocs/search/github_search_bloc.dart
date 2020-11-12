import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_app/src/blocs/search/github_search_event.dart';
import 'package:test_app/src/blocs/search/github_search_state.dart';
import 'package:test_app/src/models/github_repository.dart';
import 'package:test_app/src/models/search_result_error.dart';

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  final GithubRepository githubRepository;

  GithubSearchBloc({@required this.githubRepository}) : super(SearchStateEmpty()) ;

  @override
  Stream<Transition<GithubSearchEvent, GithubSearchState>> transformEvents(
    Stream<GithubSearchEvent> events,
    Stream<Transition<GithubSearchEvent, GithubSearchState>> Function(
      GithubSearchEvent event,
    )
        transitionFn,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  void onTransition(
      Transition<GithubSearchEvent, GithubSearchState> transition) {
    print(transition);
    super.onTransition(transition);
  }



  @override
  Stream<GithubSearchState> mapEventToState(
    GithubSearchEvent event,
  ) async* {
    if (event is TextChanged) {
      final String searchTerm = event.text;
      if (searchTerm.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        try {
          final results = await githubRepository.search(searchTerm);
          yield SearchStateSuccess(results.items);
        } catch (error) {
          print(error);
          yield error is SearchResultError
              ? SearchStateError(error.message)
              : SearchStateError('something went wrong $error');
        }
      }
    }
  }

}
