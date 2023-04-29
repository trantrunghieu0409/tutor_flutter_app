import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tutor_flutter_app/core/exceptions/server_exception.dart';
import 'package:tutor_flutter_app/data/models/request/history_req.dart';
import 'package:tutor_flutter_app/data/repositories/history_repository.dart';
import 'package:tutor_flutter_app/domain/entities/failure_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/history_entity.dart';
import 'package:tutor_flutter_app/domain/mapper/history_mapper.dart';

class HistoryUsecase {
  late final HistoryRepository _historyRepository;

  HistoryUsecase(this._historyRepository);

  final HistoryMapper _historyMapper = HistoryMapperImpl();

  Future<Either<FailureEntity, List<HistoryEntity>>> getHistory(
      HistoryReq historyReq) async {
    try {
      var resp = await _historyRepository.getHistory(historyReq);

      return right(
          resp.data.rows.map((e) => _historyMapper.fromModel(e)).toList());
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }
}
