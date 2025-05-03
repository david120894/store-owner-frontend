import 'package:store_flutter/domain/entities/person.dart';

class User {
  final int id;
  final String username;
  final List<String> roles;
  final Person person;

  User({
    required this.id,
    required this.username,
    required this.roles,
    required this.person,
  });
}
