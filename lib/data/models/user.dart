import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String? name;
  final String? picture;
  final String email;

  const AppUser({this.name, this.picture, required this.email});

  static const empty = AppUser(email: '');

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

  @override
  List<Object?> get props => [email, name, picture];
}
