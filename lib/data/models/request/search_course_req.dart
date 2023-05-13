// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tutor_flutter_app/core/constants/common_consts.dart';
import 'package:tutor_flutter_app/data/models/request/base_req.dart';

class SearchCourseReq extends BaseReq {
  late String? query;
  late List<int> levels;
  late List<String> categoryIds;
  late String? direction;

  SearchCourseReq(
      {this.query,
      this.levels = const [],
      this.direction,
      this.categoryIds = const [],
      int? page,
      int? perPage})
      : super(
            page: page ?? BaseReq.defaultPage,
            perPage: perPage ?? BaseReq.defaultPageSize);

  toQueryParams() {
    String queries = "?page=$page&perPage=$perPage";

    if (query != null) queries += "&q=$query";
    for (var level in levels) {
      queries += "&level[]=$level";
    }
    for (var categoryId in categoryIds) {
      queries += "&categoryId[]=$categoryId";
    }
    if (direction != null) {
      queries +=
          "&order[]=level&orderBy[]=${direction == CommonConsts.asc ? CommonConsts.asc : CommonConsts.desc}";
    }
    return queries;
  }
}
