import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static final storage = FlutterSecureStorage();
  Dio dio = new Dio();

  login(email, password) async {
    try {
      var res = await dio.post(
          "https://backend-flutter.herokuapp.com/api/auth/login",
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));

      await storage.write(key: "token", value: res.data["token"]);
      var token = await storage.read(key: "token");
      log("TOKEN" + token.toString());
      return res;
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

  static Future<String?> getToken() async {
    return await storage.read(key: "token");
  }
}
