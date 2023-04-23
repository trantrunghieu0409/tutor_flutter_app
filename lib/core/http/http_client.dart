import 'dart:developer';

import 'package:http/http.dart';
import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/constants/http_constants.dart';
import 'package:tutor_flutter_app/core/utils/http_utils.dart';

class HttpClient {
  late Client client;
  String host;
  late Map<String, String> header;

  HttpClient({
    required this.host,
  }) {
    client = Client();
  }

  factory HttpClient.setLetTutorHost() =>
      HttpClient(host: LettutorConfig.endpoint);

  Uri _getParsedUrl(String path) {
    return Uri.parse('$host$path');
  }

  Map<String, String> _generateAuthorizationHeader(token) => {
        HttpConstants.authorization: "Bearer $token",
      };

  Map<String, String> _generateRequestHeader(auth, token, [
    Map<String, String> overrideHeader = const {},
  ]) =>
      {
        if (auth) ..._generateAuthorizationHeader(token),
        HttpConstants.contentType: HttpConstants.jsonContentType,
        ...overrideHeader,
      };

  dynamic get({required String path, bool auth = false, String? token}) async {
    final requestHeader = _generateRequestHeader(auth, token);

    final Response response = await client.get(
      _getParsedUrl(path),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic post({required String path, dynamic body, bool auth = false, String? token}) async {
    final requestHeader = _generateRequestHeader(auth, token);

    log("path: $host$path");
    log("header: $requestHeader");
    log("body: $body");

    final Response response = await client.post(
      _getParsedUrl(path),
      body: HttpUtil.encodeRequestBody(
          body, requestHeader[HttpConstants.contentType]!),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }
}
