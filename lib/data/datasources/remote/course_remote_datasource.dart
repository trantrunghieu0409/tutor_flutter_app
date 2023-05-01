import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/http/http_client.dart';
import 'package:tutor_flutter_app/data/models/request/base_req.dart';
import 'package:tutor_flutter_app/data/models/response/book_resp.dart';
import 'package:tutor_flutter_app/data/models/response/course_resp.dart';

class CourseRemoteDatasource {
  final HttpClient _httpClient;

  CourseRemoteDatasource(this._httpClient);

  Future<CourseResp> getCourses(String token, BaseReq baseReq) async {
    final Map<String, dynamic> data = await _httpClient.get(
        path:
            "${LettutorConfig.getCourses}?page=${baseReq.page}&size=${baseReq.perPage}",
        auth: true,
        token: token);

    return CourseResp.fromJson(data);
  }

   Future<BookResp> getEBooks(String token, BaseReq baseReq) async {
    final Map<String, dynamic> data = await _httpClient.get(
        path:
            "${LettutorConfig.getEBooks}?page=${baseReq.page}&size=${baseReq.perPage}",
        auth: true,
        token: token);

    return BookResp.fromJson(data);
  }
}
