import 'package:store_flutter/data/models/user.dart';
import 'package:store_flutter/domain/entities/user.dart';

class PersonResponse {
  final String token;
  final User user;
  PersonResponse({required this.token, required this.user});
  factory PersonResponse.fromJson(Map<String, dynamic> json) {
    return PersonResponse(
      token: json['token'],
      user: UserModels.fromJson(json['user']),
    );
  }
}
