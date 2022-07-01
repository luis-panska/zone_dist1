import 'dart:developer';
import 'package:flutter_zone_dist/src/models/category_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_zone_dist/src/models/delivery_response.dart';
import 'package:flutter_zone_dist/src/models/method_response.dart';
import 'package:flutter_zone_dist/src/models/products_by_category_response.dart';
import 'package:flutter_zone_dist/src/services/authservice.dart';

class DeliveryService {
  final Dio _dio = Dio();
  final _baseUrl = "https://backend-flutter.herokuapp.com/api/deliveries";

  Future<MethodResponse?> list() async {
    MethodResponse? methodResponse;
    try {
      Response methods = await _dio.get(_baseUrl);
      return MethodResponse.fromMap(methods.data);
    } on DioError catch (e) {
      log('Error sending request!');
      log(e.message);
    }
    return null;
  }

  create({identification, address, pin, phone, date, userId}) async {
    try {
      log("token" + AuthService.token);
      Response delivery = await _dio.post(_baseUrl,
          data: {
            "identification": identification,
            "address": address,
            "pin": pin,
            "phone": phone,
            "date": date,
          },
          options: Options(
              contentType: Headers.formUrlEncodedContentType,
              headers: {"Authorization": "Bearer " + AuthService.token}));
      return delivery;
    } on DioError catch (e) {
      log('Error sending request!');
      log(e.message);
      return e.response;
    }
  }
}
