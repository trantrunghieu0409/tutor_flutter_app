
import 'package:tutor_flutter_app/data/datasources/remote/account_remote_datasource.dart';
import 'package:tutor_flutter_app/data/models/response/login_resp.dart';

class AccountRepository {
  final AccountRemoteDatasource _accountRemoteDatasource;

  AccountRepository(this._accountRemoteDatasource);

  Future<LoginResp> login({required String email, required String password}) async {
    return await _accountRemoteDatasource.login(email: email, password: password);
  }
}
