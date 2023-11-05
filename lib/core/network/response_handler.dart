import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mi_practical/core/print/debug_print.dart';
import 'package:mi_practical/core/utils/const/string_const.dart';
import 'package:mi_practical/di/dependency_injection.dart';

class ResponseHandler {
  Future responseHandlerFun<T>({
    required Response response,
    required String urlPath,
    required Function fun,
  }) async {
    final print = sl<PrintX>();
    try {
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        debugPrint('$urlPath\'s API CALL SUCCESS');
        return fun(response.body);
      } else if (response.statusCode >= 300 && response.statusCode <= 400) {
        print.error('${StringX.badRequestError} API -> $urlPath');
        return fun(response.body);
      } else if (response.statusCode == 401) {
        print.error('${StringX.unauthorizedError} API -> $urlPath');
        return fun(response.body);
      } else if (response.statusCode > 401 && response.statusCode < 500) {
        print.error('${StringX.unknownError} $urlPath $T');
        return fun(response.body);
      } else if (response.statusCode >= 500) {
        print.error('${StringX.serverError} API -> $urlPath');
        return fun(response.body);
      } else {
        throw Exception();
      }
    } on SocketException catch (e) {
      print.info('SocketException = $e');
      return e;
    } on HttpException catch (e) {
      print.info('HttpException = $e');
      return e;
    } on ClientException catch (e) {
      print.info('ClientException = $e');
      return e;
    } catch (e) {
      print.error('Something went wrong in this "$urlPath" API :- $e');
      return e;
    }
  }
}
