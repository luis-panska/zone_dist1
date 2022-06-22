import 'dart:developer';
import 'package:flutter_zone_dist/src/models/category_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_zone_dist/src/models/creditcard_response.dart';
import 'package:flutter_zone_dist/src/models/products_by_category_response.dart';
import 'package:flutter_zone_dist/src/services/authservice.dart';

class CreditCardService {
  final Dio _dio = Dio();
  final _baseUrl = "https://backend-flutter.herokuapp.com/api/credit-card";

  Future<CategoryResponse?> list() async {
    CategoryResponse? categoryResponse;
    try {
      Response categories = await _dio.get(_baseUrl);
      return CategoryResponse.fromMap(categories.data);
    } on DioError catch (e) {
      log('Error sending request!');
      log(e.message);
    }
    return null;
  }

  create({
    required String name,
    required String number,
    required String expiration,
    required int cvv,
    required String userId,
  }) async {
    try {
      log('Creating credit card');
      Response creditCard = await _dio.post("$_baseUrl",
          data: {
            "name": name,
            "number": number,
            "expiration": expiration,
            "cvv": cvv,
            "userId": userId,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return CreditCardCreateResponse.fromMap(creditCard.data);
    } on DioError catch (e) {
      return e.response;
    }
  }
}
