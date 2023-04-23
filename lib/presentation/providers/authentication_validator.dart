import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/domain/entities/failure_entity.dart';
import 'package:tutor_flutter_app/domain/usecases/account_usecase.dart';

class AutheticationValidator {
  late final AccountUsecase _accountUsecase;

  AutheticationValidator(this._accountUsecase);

  UserEntity? user;
  bool _isAuthenticated = false;
  FailureEntity? failure;

  Future<bool> login(String email, String password) async {
    var resp = await _accountUsecase.login(email, password);
    resp.fold((l) => {failure = l}, (r) => user = r);
    _isAuthenticated = resp.isRight();
    return isAuthenticated;
  }

  bool get isAuthenticated => _isAuthenticated;

  void logOut() {
    _isAuthenticated = false;
  }
}
