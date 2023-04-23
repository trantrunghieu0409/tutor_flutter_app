import 'dart:convert';

import 'package:http/http.dart';
import 'package:tutor_flutter_app/core/exceptions/server_exception.dart';

class HttpUtil {
  static dynamic encodeRequestBody(dynamic data, String contentType) {
    return data;
  }

  static String getErroredResult(dynamic result) {
    if (result['message'] is String) {
      return result['message'];
    }
    return "Something went wrong!";
  }

  static dynamic getResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(utf8.decode(response.bodyBytes));
      case 204:
        return null;
      default:
        throw ServerException(
          statusCode: response.statusCode,
          message:
              getErroredResult(jsonDecode(utf8.decode(response.bodyBytes))),
        );
    }
  }
}
