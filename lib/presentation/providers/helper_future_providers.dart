import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/domain/usecases/history_usecase.dart';
import 'package:tutor_flutter_app/presentation/providers/authentication_validator.dart';

final totalProvider = FutureProvider<int>((ref) async {
  var historyUsecase = Injector.resolve<HistoryUsecase>();
  var resp = await historyUsecase.getTotalLessonTime();
  return resp.fold((l) => throw l, (r) => r);
});

final userProvider = FutureProvider<UserEntity>((ref) async {
  return Injector.resolve<AutheticationValidator>().user!;
});
