import 'package:tutor_flutter_app/data/datasources/local/account_local_datasource.dart';
import 'package:tutor_flutter_app/data/datasources/remote/tutor_remote_datasource.dart';
import 'package:tutor_flutter_app/data/models/response/tutors_resp.dart';

class TutorRepository {
  final TutorRemoteDatasource _tutorRemoteDatasource;
  final AccountLocalDatasource _accountLocalDatasource;

  TutorRepository(this._tutorRemoteDatasource, this._accountLocalDatasource);

  Future<TutorsResp> getAll() async {
    var token = await _accountLocalDatasource.getToken();
    var resp = await _tutorRemoteDatasource.getAll(token.token);

    return resp;
  }

  Future<Tutors> search(
      List<String> specialities, String name, bool? isVietnamese) async {
    var token = await _accountLocalDatasource.getToken();
    var resp = await _tutorRemoteDatasource.search(
        token.token, specialities, name, isVietnamese);

    return resp;
  }
}
