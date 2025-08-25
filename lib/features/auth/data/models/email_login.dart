// To parse this JSON data, do
//
//     final emailOtpModel = emailOtpModelFromJson(jsonString);

import 'dart:convert';

EmailOtpModel emailOtpModelFromJson(String str) => EmailOtpModel.fromJson(json.decode(str));

String emailOtpModelToJson(EmailOtpModel data) => json.encode(data.toJson());

class EmailOtpModel {
    bool success;
    String message;
    String userId;
    bool isNewUser;

    EmailOtpModel({
        required this.success,
        required this.message,
        required this.userId,
        required this.isNewUser,
    });

    factory EmailOtpModel.fromJson(Map<String, dynamic> json) => EmailOtpModel(
        success: json["success"],
        message: json["message"],
        userId: json["userId"],
        isNewUser: json["isNewUser"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "userId": userId,
        "isNewUser": isNewUser,
    };
}
