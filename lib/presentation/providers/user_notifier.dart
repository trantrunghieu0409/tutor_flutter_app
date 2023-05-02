import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/domain/entities/common/level_enum.dart';
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

  Future<void> updateUserInfo(
      String name, String studySchedule, String levelValue) async {
    if (state == null) return;

    var copyUser = state!.copyWith(
        name: name,
        studySchedule: studySchedule,
        level: LevelEnum.getFilterKey(levelValue));

    var resp = await _accountUsecase.updateUserInfo(copyUser);

    state = resp.fold((l) {
      log(l.error);
      return state;
    }, (r) => r);
    log(state!.name);
    log(state!.studySchedule!);
  }

  bool get isLoading => state == null;
}

final userProvider = StateNotifierProvider<UserNotifier, UserEntity?>((ref) {
  return UserNotifier();
});
