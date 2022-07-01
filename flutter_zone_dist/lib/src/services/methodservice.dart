import 'dart:developer';
import 'package:flutter_zone_dist/src/models/category_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_zone_dist/src/models/method_response.dart';
import 'package:flutter_zone_dist/src/models/products_by_category_response.dart';

class MethodService {
  final Dio _dio = Dio();
  final _baseUrl = "https://backend-flutter.herokuapp.com/api/method-payment";

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
}
