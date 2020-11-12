
import 'package:test_app/src/models/github_user.dart';

class SearchResultItem {
  final String id;
  final String name; //fulname
  final String contry; //htmlurl
  final GithubUser user; //owners

  const SearchResultItem({
    this.id, 
    this.name, 
    this.contry, 
    this.user
    });

  static SearchResultItem fromJson(dynamic json) {
    return SearchResultItem(
      id: json['id'] as String,
      name: json['name'] as String,
      contry: json['contry'] as String,
      user: GithubUser.fromJson(json['user']),
    );
  }
}
