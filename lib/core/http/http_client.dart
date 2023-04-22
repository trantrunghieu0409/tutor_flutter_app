import 'dart:developer';

import 'package:http/http.dart';
import 'package:tutor_flutter_app/core/config/tutor_api_config.dart';
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

  factory HttpClient.setChatgptAPIhost() =>
      HttpClient(host: TutorApiConfig.endpoint);

  Uri _getParsedUrl(String path) {
    return Uri.parse('$host$path');
  }

  Map<String, String> _generateAuthorizationHeader() => {
        HttpConstants.authorization: TutorApiConfig.token,
        HttpConstants.contentType: HttpConstants.jsonContentType
      };

  Map<String, String> _generateRequestHeader([
    Map<String, String> overrideHeader = const {},
  ]) =>
      {
        ..._generateAuthorizationHeader(),
        ...overrideHeader,
      };

  dynamic get(String path) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client.get(
      _getParsedUrl(path),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic post({required String path, dynamic body}) async {
    final requestHeader = _generateRequestHeader();

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
