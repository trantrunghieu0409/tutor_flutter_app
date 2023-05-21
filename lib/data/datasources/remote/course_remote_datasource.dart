import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/http/http_client.dart';
import 'package:tutor_flutter_app/data/models/request/base_req.dart';
import 'package:tutor_flutter_app/data/models/request/search_course_req.dart';
import 'package:tutor_flutter_app/data/models/response/book_resp.dart';
import 'package:tutor_flutter_app/data/models/response/categories_resp.dart';
import 'package:tutor_flutter_app/data/models/response/course_resp.dart';

class CourseRemoteDatasource {
  final HttpClient _httpClient;

  CourseRemoteDatasource(this._httpClient);

  Future<CourseResp> getCourses(
      String token, SearchCourseReq searchCourseReq) async {
    final Map<String, dynamic> data = await _httpClient.get(
        path: LettutorConfig.getCourses + searchCourseReq.toQueryParams(),
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

  Future<CategoriesResp> getCategories(String token) async {
    final Map<String, dynamic> data = await _httpClient.get(
        path: LettutorConfig.getCategories, auth: true, token: token);

    return CategoriesResp.fromJson(data);
  }
}
