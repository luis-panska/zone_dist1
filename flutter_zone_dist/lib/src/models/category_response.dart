// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CategoryResponse categoryResponseFromMap(String str) =>
    CategoryResponse.fromMap(json.decode(str));

String categoryResponseToMap(CategoryResponse data) =>
    json.encode(data.toMap());

class CategoryResponse {
  CategoryResponse({
    required this.ok,
    required this.message,
    required this.categories,
  });

  bool ok;
  String message;
  List<Category> categories;

  factory CategoryResponse.fromMap(Map<String, dynamic> json) =>
      CategoryResponse(
        ok: json["ok"],
        message: json["message"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "message": message,
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String description;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "description": description,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
