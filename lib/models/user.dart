class User {
  final id;
  final String token;

  User(this.id, {required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['id'], token: json['access']);
  }
}