import 'package:tutor_flutter_app/data/datasources/local/account_local_datasource.dart';
import 'package:tutor_flutter_app/data/datasources/remote/tutor_remote_datasource.dart';
import 'package:tutor_flutter_app/data/models/request/search_tutor_req.dart';
import 'package:tutor_flutter_app/data/models/response/booking_resp.dart';
import 'package:tutor_flutter_app/data/models/response/schedule_resp.dart';
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

  Future<Tutors> search(SearchTutorReq searchTutorReq) async {
    var token = await _accountLocalDatasource.getToken();
    var resp = await _tutorRemoteDatasource.search(token.token, searchTutorReq);

    return resp;
  }

  Future<ScheduleResp> getScheduleByTutorId(
      String tutorId, int startTimestamp, int endTimestamp) async {
    var token = await _accountLocalDatasource.getToken();
    var resp = await _tutorRemoteDatasource.getScheduleByTutorId(
        token.token, tutorId, startTimestamp, endTimestamp);

    return resp;
  }

  Future<BookingResp> bookSchedule(String scheduleDetailId, String note) async {
    var token = await _accountLocalDatasource.getToken();
    var resp = await _tutorRemoteDatasource.bookSchedule(
        token.token, scheduleDetailId, note);

    return resp;
  }
}
