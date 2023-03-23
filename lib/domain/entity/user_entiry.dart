import 'dart:convert';

import 'package:flutter/cupertino.dart';

class UserEntity {
  final String id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? address;
  String? url;
  int? score;

  UserEntity({
    required this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.address,
    this.url,
  });

  Map<String, dynamic> toJson() => {
        'data': {
          'id': int.parse(id),
          'phoneNumber': phoneNumber,
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'address': address,
          'url': url,
        },
        "meta": {}
      };

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];
    return UserEntity(
      id: json['id'].toString(),
      firstName: attributes['firstName'],
      lastName: attributes['lastName'],
      phoneNumber: attributes['phoneNumber'],
      email: attributes['email'],
      address: attributes['address'],
      url: attributes['url'] ?? '',
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return """ 
    ID: $id
    FirstName :$firstName
    LastName :$lastName
    Phone:$phoneNumber
    Email:$email
    Address:$address
    url:$url

    """;
  }
}
