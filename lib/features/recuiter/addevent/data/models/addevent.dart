// To parse this JSON data, do
//
//     final addEvent = addEventFromJson(jsonString);

import 'dart:convert';

AddEvent addEventFromJson(String str) => AddEvent.fromJson(json.decode(str));

String addEventToJson(AddEvent data) => json.encode(data.toJson());

class AddEvent {
  String? id;
  String? userId;
  String? role;
  String? title;
  String? content;
  String? requirement;
  String? responsibility;
  String? location;
  int? payment;
  String? paymentDate;
  int? total;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;
  bool? isActive;

  AddEvent({
    this.id,
    this.userId,
    this.role,
    this.title,
    this.content,
    this.requirement,
    this.responsibility,
    this.location,
    this.payment,
    this.paymentDate,
    this.total,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.isActive,
  });

  factory AddEvent.fromJson(Map<String, dynamic> json) => AddEvent(
        id: json["id"] as String?,
        userId: json["userId"] as String?,
        role: json["role"] as String?,
        title: json["title"] as String?,
        content: json["content"] as String?,
        requirement: json["requirement"] as String?,
        responsibility: json["responsibility"] as String?,
        location: json["location"] as String?,
        payment: json["payment"] is int ? json["payment"] : int.tryParse("${json["payment"]}"),
        paymentDate: json["paymentDate"] as String?,
        total: json["total"] is int ? json["total"] : int.tryParse("${json["total"]}"),
        startDate: json["startDate"] as String?,
        endDate: json["endDate"] as String?,
        createdAt: json["createdAt"] as String?,
        updatedAt: json["updatedAt"] as String?,
        isActive: json["is_active"] == null ? null : json["is_active"] as bool,
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
      };
}
