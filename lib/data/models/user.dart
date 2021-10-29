import 'dart:convert';

class AppUser {
  final String? name;
  final String? picture;
  final String email;

  AppUser({this.name, this.picture, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'picture': picture,
      'email': email,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    print(map);
    return AppUser(
      name: map['name'],
      picture: map['picture'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));
}
