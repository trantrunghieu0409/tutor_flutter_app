import 'package:tutor_flutter_app/domain/entities/history/history_entity.dart';

class HistoryResult {
  late int total;
  late List<HistoryEntity> histories;

  HistoryResult({this.total = 0, this.histories = const []});
}
