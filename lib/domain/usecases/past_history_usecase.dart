import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tutor_flutter_app/core/exceptions/server_exception.dart';
import 'package:tutor_flutter_app/data/models/request/past_history_req.dart';
import 'package:tutor_flutter_app/data/repositories/past_history_repository.dart';
import 'package:tutor_flutter_app/domain/entities/common/failure_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/past_history_entity.dart';
import 'package:tutor_flutter_app/domain/mapper/past_history_mapper.dart';

class PastHistoryUsecase {
  late final PastHistoryRepository _pastHistoryRepository;

  PastHistoryUsecase(this._pastHistoryRepository);

  final PastHistoryMapper _pastHistoryMapper = PastHistoryMapperImpl();

  Future<Either<FailureEntity, List<PastHistoryEntity>>> getPastHistory(
      PastHistoryReq pastHistoryReq) async {
    try {
      var resp = await _pastHistoryRepository.getPastHistory(pastHistoryReq);

      return right(
          resp.rows.map((e) => _pastHistoryMapper.fromModel(e)).toList());
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }
}
