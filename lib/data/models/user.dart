import 'package:store_flutter/data/models/person.dart';
import 'package:store_flutter/domain/entities/user.dart';

class UserModels extends User {
  UserModels({
    required super.id,
    required super.username,
    required super.roles,
    required super.person,
  });

  factory UserModels.fromJson(Map<String, dynamic> json) {
    return UserModels(
      id: json['id'],
      username: json['username'],
      roles: List<String>.from(json['roles']),
      person: PersonModels.fromJson(json['person']),
    );
  }
}
