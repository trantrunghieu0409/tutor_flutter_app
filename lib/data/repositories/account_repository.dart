import 'package:image_picker/image_picker.dart';
import 'package:tutor_flutter_app/data/datasources/local/account_local_datasource.dart';
import 'package:tutor_flutter_app/data/datasources/remote/account_remote_datasource.dart';
import 'package:tutor_flutter_app/data/models/request/update_user_req.dart';
import 'package:tutor_flutter_app/data/models/response/login_resp.dart';
import 'package:tutor_flutter_app/data/models/response/user_info_resp.dart';
import 'package:tutor_flutter_app/domain/mapper/token_mapper.dart';

class AccountRepository {
  final AccountRemoteDatasource _accountRemoteDatasource;
  final AccountLocalDatasource _accountLocalDatasource;

  final TokenMapper _mapper = TokenMapperImpl();

  AccountRepository(
      this._accountRemoteDatasource, this._accountLocalDatasource);

  Future<LoginResp> login(
      {required String email, required String password}) async {
    var resp =
        await _accountRemoteDatasource.login(email: email, password: password);

    _accountLocalDatasource
        .saveToken(_mapper.fromAccessModel(resp.tokens.access));

    return resp;
  }

  Future<void> register(
      {required String email, required String password}) async {
    await _accountRemoteDatasource.register(email: email, password: password);
  }

  Future<void> forgotPassword(String email) async {
    await _accountRemoteDatasource.forgotPassword(email);
  }

  Future<UserInfoResp> getUserInfo() async {
    var token = await _accountLocalDatasource.getToken();
    var resp = await _accountRemoteDatasource.getUserInfo(token.token);

    return resp;
  }

  Future<UserInfoResp> updateUserInfo(UpdateUserReq updateUserReq) async {
    var token = await _accountLocalDatasource.getToken();
    var resp = await _accountRemoteDatasource.updateUserInfo(
        token.token, updateUserReq);

    return resp;
  }

  Future<bool> uploadAvatar(XFile avatar) async {
    var token = await _accountLocalDatasource.getToken();
    await _accountRemoteDatasource.uploadAvatar(token.token, avatar);

    return true;
  }
}
