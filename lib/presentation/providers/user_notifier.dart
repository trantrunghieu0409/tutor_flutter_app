import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/domain/usecases/account_usecase.dart';

class UserNotifier extends StateNotifier<UserEntity?> {
  late AccountUsecase _accountUsecase;

  UserNotifier() : super(null) {
    _accountUsecase = Injector.resolve<AccountUsecase>();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    var resp = await _accountUsecase.getUserInfo();

    state = resp.fold((l) {
      log(l.error);
      return state;
    }, (r) => r);
    log(state!.name);
  }

  bool get isLoading => state == null;
}

final userProvider = StateNotifierProvider<UserNotifier, UserEntity?>((ref) {
  return UserNotifier();
});
