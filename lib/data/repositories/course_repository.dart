import 'package:tutor_flutter_app/data/datasources/local/account_local_datasource.dart';
import 'package:tutor_flutter_app/data/datasources/remote/course_remote_datasource.dart';
import 'package:tutor_flutter_app/data/models/request/base_req.dart';
import 'package:tutor_flutter_app/data/models/request/search_course_req.dart';
import 'package:tutor_flutter_app/data/models/response/book_resp.dart';
import 'package:tutor_flutter_app/data/models/response/categories_resp.dart';
import 'package:tutor_flutter_app/data/models/response/course_resp.dart';

class CourseRepository {
  final CourseRemoteDatasource _courseRemoteDatasource;
  final AccountLocalDatasource _accountLocalDatasource;

  CourseRepository(this._courseRemoteDatasource, this._accountLocalDatasource);

  Future<CourseResp> getCourses(SearchCourseReq searchCourseReq) async {
    var token = await _accountLocalDatasource.getToken();
    return await _courseRemoteDatasource.getCourses(
        token.token, searchCourseReq);
  }

  Future<BookResp> getEBooks(BaseReq baseReq) async {
    var token = await _accountLocalDatasource.getToken();
    return await _courseRemoteDatasource.getEBooks(token.token, baseReq);
  }

  Future<CategoriesResp> getCategories() async {
    var token = await _accountLocalDatasource.getToken();
    return await _courseRemoteDatasource.getCategories(token.token);
  }
}
