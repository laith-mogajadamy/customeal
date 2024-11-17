import 'dart:io';
import 'package:customeal/core/network/global.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class Uploadfile {
  static Future userprofileedit(
    int id,
    String token,
    final File? fimage,
    final String? name,
    final String? email,
    final String? password,
    final String? passwordconfirmation,
    final String? number,
    final String? city,
    final String? location,
  ) async {
    print("Uploadfile");
    print(fimage);

    FormData formdata = FormData.fromMap(
      {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordconfirmation,
        "phone": number,
        "city": city,
        "location": location,
        "profile": await MultipartFile.fromFile(
          fimage!.path,
          filename: fimage.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
      },
    );

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };

    Response response = await Dio().post(
      "${Global.url}lawyer/$id",
      data: formdata,
      options: Options(headers: headers, method: "POST"),
      onSendProgress: (count, total) {
        print("count=$count");
        print("total=$total");
      },
    );
    print(response.statusCode);

    print(response.data);
    return response;
  }
}
