import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/constants/http_constants.dart';
import 'package:tutor_flutter_app/core/utils/dio_http_utils.dart';

class DioClient {
  late Dio client;
  String host;
  late Map<String, String> header;

  DioClient({
    required this.host,
  }) {
    client = Dio();
    client.options.baseUrl = host;
  }

  factory DioClient.setLetTutorHost() =>
      DioClient(host: LettutorConfig.endpoint);

  Map<String, String> _generateAuthorizationHeader(token) => {
        HttpConstants.authorization: "Bearer $token",
      };

  Map<String, String> _generateRequestHeader(
    auth,
    token, [
    Map<String, String> overrideHeader = const {},
  ]) =>
      {
        if (auth) ..._generateAuthorizationHeader(token),
        ...overrideHeader,
      };

  _getOptions(bool auth, String token) {
    return Options(
      headers: _generateRequestHeader(auth, token),
    );
  }

  dynamic post(
      {required String path,
      dynamic body,
      bool auth = false,
      String? token}) async {
    final requestHeader = _generateRequestHeader(auth, token);

    log('method: post');
    log("path: $host$path");
    log("header: $requestHeader");
    log("body: $body");

    final Response response = await client.post(path,
        data: body, options: _getOptions(auth, token ?? ""));

    return DioHttpUtils.getResponse(
      response,
    );
  }
}
