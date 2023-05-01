import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/domain/entities/common/failure_entity.dart';
import 'package:tutor_flutter_app/domain/usecases/account_usecase.dart';

class AutheticationValidator {
  late final AccountUsecase _accountUsecase;

  AutheticationValidator(this._accountUsecase);

  UserEntity? _user;
  bool _isAuthenticated = false;
  FailureEntity? failure;

  Future<bool> login(String email, String password) async {
    var resp = await _accountUsecase.login(email, password);
    resp.fold((l) => {failure = l}, (r) => _user = r);
    _isAuthenticated = resp.isRight();
    return isAuthenticated;
  }

  Future<bool> register(String email, String password) {
    return Future.delayed(const Duration(seconds: 1), () => false);
  }

  bool get isAuthenticated => _isAuthenticated;
  UserEntity? get user => _user;

  void logOut() {
    _isAuthenticated = false;
  }
}
