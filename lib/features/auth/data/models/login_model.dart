// To parse this JSON data, do
//
//     final loginApiResponse = loginApiResponseFromJson(jsonString);

import 'dart:convert';

LoginApiResponse loginApiResponseFromJson(String str) => LoginApiResponse.fromJson(json.decode(str));

String loginApiResponseToJson(LoginApiResponse data) => json.encode(data.toJson());

class LoginApiResponse {
    User user;
    String token;

    LoginApiResponse({
        required this.user,
        required this.token,
    });

    factory LoginApiResponse.fromJson(Map<String, dynamic> json) => LoginApiResponse(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}

class User {
    String id;
    String name;
    String email;
    String password;
    List<String> photos;
    String role;
    String createdAt;
    String updatedAt;
    int v;
    int age;
    String color;
    String experience;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.photos,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.age,
        required this.color,
        required this.experience,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        role: json["role"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        age: json["age"],
        color: json["color"],
        experience: json["experience"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "role": role,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "age": age,
        "color": color,
        "experience": experience,
    };
}
