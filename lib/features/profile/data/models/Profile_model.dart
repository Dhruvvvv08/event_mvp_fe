// To parse this JSON data, do
//
//     final updateProfile = updateProfileFromJson(jsonString);

import 'dart:convert';

UpdateProfile updateProfileFromJson(String str) => UpdateProfile.fromJson(json.decode(str));

String updateProfileToJson(UpdateProfile data) => json.encode(data.toJson());

class UpdateProfile {
  String message;
  User user;

  UpdateProfile({
    required this.message,
    required this.user,
  });

  factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
        message: json["message"] ?? "",
        user: User.fromJson(json["user"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
      };
}

class User {
  String id;
  String email;
  String name;
  String? dateOfBirth;
  String? phoneNumber;
  String role;
  int? height;
  int? weight;
  String? gender;
  String? englishLevel;
  String? address;
  String? state;
  String? country;
  bool isActive;

  User({
    required this.id,
    required this.email,
    required this.name,
    this.dateOfBirth,
    this.phoneNumber,
    required this.role,
    this.height,
    this.weight,
    this.gender,
    this.englishLevel,
    this.address,
    this.state,
    this.country,
    required this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? "",
        email: json["email"] ?? "",
        name: json["name"] ?? "",
        dateOfBirth: json["date_of_birth"],
        phoneNumber: json["phone_number"],
        role: json["role"] ?? "",
        height: json["height"],
        weight: json["weight"],
        gender: json["gender"],
        englishLevel: json["english_level"],
        address: json["address"],
        state: json["state"],
        country: json["country"],
        isActive: json["is_active"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "date_of_birth": dateOfBirth,
        "phone_number": phoneNumber,
        "role": role,
        "height": height,
        "weight": weight,
        "gender": gender,
        "english_level": englishLevel,
        "address": address,
        "state": state,
        "country": country,
        "is_active": isActive,
      };
}
