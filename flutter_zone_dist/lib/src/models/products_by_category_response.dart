// To parse this JSON data, do
//
//     final productsByCategoryResponse = productsByCategoryResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductsByCategoryResponse productsByCategoryResponseFromMap(String str) =>
    ProductsByCategoryResponse.fromMap(json.decode(str));

String productsByCategoryResponseToMap(ProductsByCategoryResponse data) =>
    json.encode(data.toMap());

class ProductsByCategoryResponse {
  ProductsByCategoryResponse({
    required this.ok,
    required this.message,
    required this.products,
  });

  bool ok;
  String message;
  List<Product> products;

  factory ProductsByCategoryResponse.fromMap(Map<String, dynamic> json) =>
      ProductsByCategoryResponse(
        ok: json["ok"],
        message: json["message"],
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "message": message,
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String description;
  double price;
  String image;
  String categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"].toDouble(),
        image: json["image"],
        categoryId: json["categoryId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "categoryId": categoryId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
