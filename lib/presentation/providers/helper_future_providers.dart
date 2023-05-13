import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/domain/entities/course/category_entity.dart';
import 'package:tutor_flutter_app/domain/usecases/course_usecase.dart';
import 'package:tutor_flutter_app/domain/usecases/history_usecase.dart';

final totalProvider = FutureProvider<int>((ref) async {
  var historyUsecase = Injector.resolve<HistoryUsecase>();
  var resp = await historyUsecase.getTotalLessonTime();
  return resp.fold((l) => throw l, (r) => r);
});

final categoriesProvider = FutureProvider<List<CategoryEntity>>((ref) async {
  var courseUsecase = Injector.resolve<CourseUsecase>();
  var resp = await courseUsecase.getCategories();
  return resp.fold((l) => throw l, (r) => r);
});
