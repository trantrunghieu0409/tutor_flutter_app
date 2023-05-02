import 'dart:developer';

import 'package:tutor_flutter_app/core/exceptions/server_exception.dart';
import 'package:tutor_flutter_app/data/models/request/update_user_req.dart';
import 'package:tutor_flutter_app/data/models/response/login_resp.dart';
import 'package:tutor_flutter_app/data/models/response/user_info_resp.dart';
import 'package:tutor_flutter_app/data/repositories/account_repository.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/domain/entities/common/failure_entity.dart';
import 'package:tutor_flutter_app/domain/mapper/user_mapper.dart';
import 'package:dartz/dartz.dart';

class AccountUsecase {
  late final AccountRepository _accountRepository;

  AccountUsecase(this._accountRepository);

  final UserMapper _userMapper = UserMapperImpl();

  Future<Either<FailureEntity, UserEntity>> login(
      String email, String password) async {
    try {
      LoginResp resp =
          await _accountRepository.login(email: email, password: password);

      return right(_userMapper.fromUser(resp.user));
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }

  Future<Either<FailureEntity, UserEntity>> getUserInfo() async {
    try {
      UserInfoResp resp = await _accountRepository.getUserInfo();

      return right(_userMapper.fromUser(resp.user));
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }

  Future<Either<FailureEntity, UserEntity>> updateUserInfo(UserEntity user) async {
    try {
      UserInfoResp resp = await _accountRepository.updateUserInfo(_userMapper.fromUserEntity(user));
      return right(_userMapper.fromUser(resp.user));
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }
}
