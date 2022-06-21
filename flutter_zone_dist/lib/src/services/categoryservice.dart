import 'dart:developer';
import 'package:flutter_zone_dist/src/models/category_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_zone_dist/src/models/products_by_category_response.dart';

class CategoryService {
  final Dio _dio = Dio();
  final _baseUrl = "https://backend-flutter.herokuapp.com/api/categories";

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

  Future<ProductsByCategoryResponse?> listProductsByCategory(
      String categoryId) async {
    ProductsByCategoryResponse? productsByCategoryResponse;
    try {
      Response products = await _dio.get("$_baseUrl/$categoryId/products");
      return ProductsByCategoryResponse.fromMap(products.data);
    } on DioError catch (e) {
      log('Error sending request!');
      log(e.message);
    }
  }
}
