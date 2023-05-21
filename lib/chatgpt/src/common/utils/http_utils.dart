import 'dart:convert';

import 'package:http/http.dart';

class HttpUtil {
  static dynamic encodeRequestBody(dynamic data, String contentType) {
    return data;
  }

  static dynamic getResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(utf8.decode(response.bodyBytes));
      default:
        throw Exception(
          "status: ${response.statusCode} - error: ${response.body}",
        );
    }
  }
}
