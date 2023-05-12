// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tutor_flutter_app/data/models/request/base_req.dart';

class SearchTutorReq extends BaseReq {
  late List<String> specialities;
  late String name;
  bool? isVietnamese;

  SearchTutorReq(
      {required this.specialities,
      required this.name,
      this.isVietnamese,
      int? page,
      int? perPage})
      : super(
            page: page ?? BaseReq.defaultPage,
            perPage: perPage ?? BaseReq.defaultPageSize);
}
