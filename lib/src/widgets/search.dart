import 'package:flutter/material.dart';
import 'package:test_app/src/models/github_repository.dart';
import 'package:test_app/src/widgets/search_form.dart';

class MySearcheWidget extends StatelessWidget {

  final GithubRepository githubRepository;

  const MySearcheWidget({
    Key key,
    this.githubRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      Text('Github Search')
      ),
      body: SearchForm()
      );
  }
}
