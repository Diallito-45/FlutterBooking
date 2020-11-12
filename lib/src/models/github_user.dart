class GithubUser {
  final String name;//login
  final String email;//avatarurl

  const GithubUser({this.name, this.email});

  static GithubUser fromJson(dynamic json) {
    return GithubUser(
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}
