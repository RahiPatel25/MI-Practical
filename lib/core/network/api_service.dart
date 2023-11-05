import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mi_practical/config/enums/server_request_type.dart';
import 'package:mi_practical/core/network/api_const.dart';
import 'package:mi_practical/core/network/response_handler.dart';
import 'package:mi_practical/core/utils/extenstions/api_server_ext.dart';
import 'package:mi_practical/di/dependency_injection.dart';

class ApiService {
  final ResponseHandler responseHandler = sl<ResponseHandler>();

  Future<dynamic> apiService<T>({
    required String urlPath,
    required Function fun,
    required ServerRequestType type,
    String? baseApiUrl,
    dynamic params,
    Map<String, String>? headers,
  }) async {
    /// [Headers]
    headers ??= {
      "Authorization": "Bearer SET_AUTH_TOKEN_FROM_SHARED_PREF",
    };

    /// [URLs]
    String url = apiServer.baseUrl + urlPath;
    if (baseApiUrl != null) url = baseApiUrl + urlPath;

    switch (type) {
      /// [GET]
      case ServerRequestType.get:
        var uri = Uri.parse(url);
        final response = await http.get(uri, headers: headers);
        debugPrint('GET API $urlPath STATUS CODE = ${response.statusCode}');
        return await responseHandler.responseHandlerFun<T>(
          response: response,
          urlPath: urlPath,
          fun: fun,
        );

      /// [POST]
      // TODOO :- Create method for post

      /// [PUT]
      // TODOO :- Create method for put

      /// [DELETE]
      // TODOO :- Create method for delete
    }
  }
}
