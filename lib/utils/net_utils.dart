import 'dart:io';

///网络请求工具类

import 'package:dio/dio.dart';

Map<String, dynamic> optHeader = {
  'content-type': 'application/x-www-form-urlencoded',
  'Connection': 'application/json;charset=UTF-8',
  'Accept-Encoding': 'Keep-Alive',
  'Cookie': 'JSESSIONID=9A8AD959742E551946CB939ECB74D1D6; Path=/Oes'
};

BaseOptions baseOptions =
    new BaseOptions(connectTimeout: 15000, headers: optHeader);
var dio = new Dio(baseOptions);

class NetUtils {
  static bool isInit = false;

  static init() {
    isInit = true;

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("================== 请求数据 ==========================");
      print("url = ${options.uri.toString()}");
      print("headers = ${options.headers}");
      print("params = ${options.data}");
      print("params = ${options.contentType}");
    }, onResponse: (Response response) {
      print("================== 响应数据 ==========================");
      print(response.statusCode);
      response.headers.forEach((name, values) {
        var temp = "";
        values.forEach((element) {
          temp += element;
        });
        print("$name : $temp");
      });
//      print(response.headers);
      print(response.data.toString());
    }, onError: (DioError err) {
      print("================== 响应错误 ==========================");
    }));

    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded").toString();
  }

  static get(
    String url, {
    Map<String, dynamic> params,
    Function success,
    Function fail,
  }) async {
    //检查是否初始化，未初始化调用init
    if (!isInit) {
      init();
    }

    try {
      var response;
      if (params != null) {
        response = await dio.get(url, queryParameters: params);
      } else {
        response = await dio.get(url);
      }
      success(response.toString());
    } catch (exception) {
      fail(exception);
      print('http request fail: $url ==> $exception');
    }
  }

  static post(
    String url,
    Map<String, dynamic> params, {
    Function success,
    Function fail,
  }) async {
    //检查是否初始化，未初始化调用init
    if (!isInit) {
      init();
    }

    try {
      var response = await dio.post(url, data: params);
      success(response.toString());
    } catch (exception) {
      fail(exception);
      print('http request fail: $url ==> $exception');
    }
  }
}
