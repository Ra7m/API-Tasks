// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:dio/dio.dart';

class DataAuth {
  final Dio dio = Dio();
  PostData(
      {required name,
      required email,
      required phone,
      required nationalId,
      required gender,
      required password,
      required token,
      required profileImage}) async {
    var response =
        await dio.post("https://elwekala.onrender.com/user/register", data: {
      {
        {
          "name": name,
          "email": email,
          "phone": phone,
          "nationalId": nationalId,
          "gender": gender,
          "password": password,
          "token": token,
          "profileImage": profileImage
        }
      }
    });
    try {
      var data = response.data;
      print(response.statusCode);
      print("========================================");
      print(data["message"]);
      print("========================================");
      return data;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data["message"]);
        var failure= error.response!.data["message"];
        return failure;
      }
    }
  }
}
