// To parse this JSON data, do
//
//     final methodResponse = methodResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MethodResponse methodResponseFromMap(String str) =>
    MethodResponse.fromMap(json.decode(str));

String methodResponseToMap(MethodResponse data) => json.encode(data.toMap());

class MethodResponse {
  MethodResponse({
    required this.ok,
    required this.message,
    required this.methodsPayment,
  });

  bool ok;
  String message;
  List<MethodsPayment> methodsPayment;

  factory MethodResponse.fromMap(Map<String, dynamic> json) => MethodResponse(
        ok: json["ok"],
        message: json["message"],
        methodsPayment: List<MethodsPayment>.from(
            json["methodsPayment"].map((x) => MethodsPayment.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "message": message,
        "methodsPayment":
            List<dynamic>.from(methodsPayment.map((x) => x.toMap())),
      };
}

class MethodsPayment {
  MethodsPayment({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.imageForm,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String description;
  String image;
  String imageForm;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory MethodsPayment.fromMap(Map<String, dynamic> json) => MethodsPayment(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        imageForm: json["imageForm"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "description": description,
        "image": image,
        "imageForm": imageForm,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
