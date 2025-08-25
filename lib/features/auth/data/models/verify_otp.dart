import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) =>
    VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  final bool success;
  final String message;
  final User? user;
  final String token;
  final bool isNewUser;

  VerifyOtpModel({
    required this.success,
    required this.message,
    required this.user,
    required this.token,
    required this.isNewUser,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
        token: json["token"] ?? "",
        isNewUser: json["isNewUser"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user": user?.toJson(),
        "token": token,
        "isNewUser": isNewUser,
      };
}

class User {
  final String id;
  final String email;
  final String name;
  final String? dateOfBirth;
  final String phoneNumber;
  final String role;
  final String? fcmToken;
  final String? height;
  final String? weight;
  final String? gender;
  final String? bloodGroup;
  final String? color;
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final String? profileImage;
  final String? zipCode;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.role,
    this.fcmToken,
    this.height,
    this.weight,
    this.gender,
    this.bloodGroup,
    this.color,
    this.address,
    this.city,
    this.state,
    this.country,
    this.profileImage,
    this.zipCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? "",
        email: json["email"] ?? "",
        name: json["name"] ?? "",
        dateOfBirth: json["date_of_birth"],
        phoneNumber: json["phone_number"] ?? "",
        role: json["role"] ?? "",
        fcmToken: json["fcm_token"],
        height: json["hieght"]?.toString(),
        weight: json["weight"]?.toString(),
        gender: json["gender"],
        bloodGroup: json["blood_group"],
        color: json["color"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        profileImage: json["profile_image"],
        zipCode: json["zip_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "date_of_birth": dateOfBirth,
        "phone_number": phoneNumber,
        "role": role,
        "fcm_token": fcmToken,
        "hieght": height,
        "weight": weight,
        "gender": gender,
        "blood_group": bloodGroup,
        "color": color,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "profile_image": profileImage,
        "zip_code": zipCode,
      };
}
