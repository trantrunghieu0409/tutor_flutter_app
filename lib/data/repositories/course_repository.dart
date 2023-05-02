import 'package:tutor_flutter_app/data/datasources/local/account_local_datasource.dart';
import 'package:tutor_flutter_app/data/datasources/remote/course_remote_datasource.dart';
import 'package:tutor_flutter_app/data/models/request/base_req.dart';
import 'package:tutor_flutter_app/data/models/response/book_resp.dart';
import 'package:tutor_flutter_app/data/models/response/course_resp.dart';

class CourseRepository {
  final CourseRemoteDatasource _courseRemoteDatasource;
  final AccountLocalDatasource _accountLocalDatasource;

  CourseRepository(this._courseRemoteDatasource, this._accountLocalDatasource);

  Future<CourseResp> getCourses(BaseReq baseReq) async {
    var token = await _accountLocalDatasource.getToken();
    var resp = await _courseRemoteDatasource.getCourses(token.token, baseReq);

    return resp;
  }

  Future<BookResp> getEBooks(BaseReq baseReq) async {
    var token = await _accountLocalDatasource.getToken();
    var resp = await _courseRemoteDatasource.getEBooks(token.token, baseReq);

    return resp;
  }
}
