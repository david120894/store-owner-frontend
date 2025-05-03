import 'package:store_flutter/domain/entities/person.dart';

class PersonModels extends Person {
  PersonModels({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.dni,
    required super.phone,
    required super.address,
    required super.city,
  });
  factory PersonModels.fromJson(Map<String, dynamic> json) {
    return PersonModels(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      dni: json['dni'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
    );
  }
}
