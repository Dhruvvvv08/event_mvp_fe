// To parse this JSON data, do
//
//     final getallEvents = getallEventsFromJson(jsonString);

import 'dart:convert';

List<GetallEvents> getallEventsFromJson(String str) => List<GetallEvents>.from(json.decode(str).map((x) => GetallEvents.fromJson(x)));

String getallEventsToJson(List<GetallEvents> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetallEvents {
    String id;
    String userId;
    String role;
    String title;
    String content;
    String requirement;
    String? responsibility;
    String? location;
    int? payment;
    String? paymentDate;
    int total;
    String startDate;
    String endDate;
    String createdAt;
    String updatedAt;
    bool isActive;
    dynamic companyName;

    GetallEvents({
        required this.id,
        required this.userId,
        required this.role,
        required this.title,
        required this.content,
        required this.requirement,
        required this.responsibility,
        required this.location,
        required this.payment,
        required this.paymentDate,
        required this.total,
        required this.startDate,
        required this.endDate,
        required this.createdAt,
        required this.updatedAt,
        required this.isActive,
        required this.companyName,
    });

    factory GetallEvents.fromJson(Map<String, dynamic> json) => GetallEvents(
        id: json["id"],
        userId: json["userId"],
        role: json["role"],
        title: json["title"],
        content: json["content"],
        requirement: json["requirement"],
        responsibility: json["responsibility"],
        location: json["location"],
        payment: json["payment"],
        paymentDate: json["paymentDate"],
        total: json["total"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        isActive: json["is_active"],
        companyName: json["company_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "role": role,
        "title": title,
        "content": content,
        "requirement": requirement,
        "responsibility": responsibility,
        "location": location,
        "payment": payment,
        "paymentDate": paymentDate,
        "total": total,
        "startDate": startDate,
        "endDate": endDate,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "is_active": isActive,
        "company_name": companyName,
    };
}
