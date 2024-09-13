import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


class NetWork {
  NetWork([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext? context;
  late Options _options;
  static Dio dio = Dio(BaseOptions(
    baseUrl: "https://api.hkanlive.com/",
    headers: {
      HttpHeaders.acceptHeader: "",
    }
  ));


  static void init() {
    dio.options.headers[HttpHeaders.authorizationHeader] = null;
  }

  Future<Response> getUrl(String url, {Map<String, dynamic>? map}) async {
      var result = await dio.get(url, queryParameters: map);
      return result;
  }
}