import 'package:tutor_flutter_app/data/models/response/course_resp.dart';

class CategoriesResp {
  CategoriesResp({
    required this.count,
    required this.rows,
  });
  late final int count;
  late final List<Categories> rows;

  CategoriesResp.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    rows = List.from(json['rows']).map((e) => Categories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['rows'] = rows.map((e) => e.toJson()).toList();
    return data;
  }
}
