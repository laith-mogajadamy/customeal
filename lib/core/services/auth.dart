import 'dart:convert';
import 'package:customeal/core/network/global.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Auth {
  static Future clientregister(
    String name,
    String email,
    String password,
    String password_confirmation,
    String phone,
    dynamic city,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    FormData formdata = FormData.fromMap(
      {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation,
        "phone": phone,
        "city": city,
      },
    );

    Response response = await Dio().post(
      "${Global.url}register",
      data: formdata,
      options: Options(method: "POST", headers: headers),
      onSendProgress: (count, total) {
        print("count=$count");
        print("total=$total");
      },
    );
    print(response.statusCode);
    print(response.data);
    return response;
  }

  //

  static Future<http.Response> login(
    String email,
    String password,
  ) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}login");
    http.Response response =
        await http.post(url, headers: Global.headers, body: body);
    return response;
  }

  static Future<http.Response> logout(String token) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
    var url = Uri.parse("${Global.url}logout");
    http.Response response = await http.post(
      url,
      headers: headers,
    );
    return response;
  }

  void printError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        print('Request to the server was cancelled.');
        break;
      case DioExceptionType.connectionTimeout:
        print('Connection timeout with the server.');
        break;
      case DioExceptionType.receiveTimeout:
        print('Receive timeout in connection with the server.');
        break;
      case DioExceptionType.badResponse:
        print('Received invalid status code: ${error.response?.statusCode}');
        print('Error data: ${error.response?.data}');
        print('Error message: ${error.message}');
        break;
      case DioExceptionType.sendTimeout:
        print('Send timeout in connection with the server.');
        break;
      case DioExceptionType.unknown:
        print('Something went wrong: ${error.message}');
        break;
      case DioExceptionType.badCertificate:
        print('Something went wrong: ${error.message}');
      case DioExceptionType.connectionError:
        print('Something went wrong: ${error.message}');
    }
  }
}
