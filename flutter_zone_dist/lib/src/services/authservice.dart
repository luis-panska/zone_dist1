import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();

  login(email, password) async {
    try {
      return await dio.post(
          "https://backend-flutter.herokuapp.com/api/auth/login",
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      return e.response;
    }
  }

  create({email, password, username, phone}) async {
    try {
      return await dio.post("https://backend-flutter.herokuapp.com/api/users",
          data: {
            "email": email,
            "password": password,
            "username": username,
            "phone": phone
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      return e.response;
    }
  }
}
