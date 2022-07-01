// To parse this JSON data, do
//
//     final deliveryResponse = deliveryResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DeliveryResponse deliveryResponseFromMap(String str) =>
    DeliveryResponse.fromMap(json.decode(str));

String deliveryResponseToMap(DeliveryResponse data) =>
    json.encode(data.toMap());

class DeliveryResponse {
  DeliveryResponse({
    required this.ok,
    required this.message,
    required this.delivery,
  });

  bool ok;
  String message;
  Delivery delivery;

  factory DeliveryResponse.fromMap(Map<String, dynamic> json) =>
      DeliveryResponse(
        ok: json["ok"],
        message: json["message"],
        delivery: Delivery.fromMap(json["delivery"]),
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "message": message,
        "delivery": delivery.toMap(),
      };
}

class Delivery {
  Delivery({
    required this.identification,
    required this.address,
    required this.pin,
    required this.phone,
    required this.date,
    required this.userId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String identification;
  String address;
  int pin;
  String phone;
  String date;
  String userId;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Delivery.fromMap(Map<String, dynamic> json) => Delivery(
        identification: json["identification"],
        address: json["address"],
        pin: json["pin"],
        phone: json["phone"],
        date: json["date"],
        userId: json["userId"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "identification": identification,
        "address": address,
        "pin": pin,
        "phone": phone,
        "date": date,
        "userId": userId,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
