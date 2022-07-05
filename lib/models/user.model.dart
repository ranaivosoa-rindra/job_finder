import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String username;
  final String email;
  final String password;
  final String token;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.token
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
      'token': token
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] ?? "",
      email: map['email'] ?? "",
      password: map['password'] ?? "",
      token: map['token'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
