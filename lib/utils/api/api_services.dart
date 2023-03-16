import 'dart:async';

import 'package:dio/dio.dart';
import 'package:task_app/utils/api/api_endpoint.dart';

class ApiServices {
  Future getUserData() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Accept"] = '*/*';
      print('${ApiEndpoint.baseUrl}${ApiEndpoint.users}');
      var response = await dio.get(
        '${ApiEndpoint.baseUrl}${ApiEndpoint.users}',
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.toString());
      return response;
    } catch (e) {
      print(e);
    }
  }
}
