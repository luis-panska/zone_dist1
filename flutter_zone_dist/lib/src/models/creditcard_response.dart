// To parse this JSON data, do
//
//     final creditCardCreateResponse = creditCardCreateResponseFromMap(jsonString);
import 'dart:convert';

CreditCardCreateResponse creditCardCreateResponseFromMap(String str) =>
    CreditCardCreateResponse.fromMap(json.decode(str));

String creditCardCreateResponseToMap(CreditCardCreateResponse data) =>
    json.encode(data.toMap());

class CreditCardCreateResponse {
  CreditCardCreateResponse({
    required this.ok,
    required this.message,
    required this.creditCard,
  });

  bool ok;
  String message;
  CreditCard creditCard;

  factory CreditCardCreateResponse.fromMap(Map<String, dynamic> json) =>
      CreditCardCreateResponse(
        ok: json["ok"],
        message: json["message"],
        creditCard: CreditCard.fromMap(json["creditCard"]),
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "message": message,
        "creditCard": creditCard.toMap(),
      };
}

class CreditCard {
  CreditCard({
    required this.name,
    required this.number,
    required this.expiration,
    required this.cvv,
    required this.userId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String name;
  String number;
  String expiration;
  int cvv;
  String userId;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory CreditCard.fromMap(Map<String, dynamic> json) => CreditCard(
        name: json["name"],
        number: json["number"],
        expiration: json["expiration"],
        cvv: json["cvv"],
        userId: json["userId"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "number": number,
        "expiration": expiration,
        "cvv": cvv,
        "userId": userId,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
