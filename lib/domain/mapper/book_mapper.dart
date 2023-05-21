import 'package:smartstruct/smartstruct.dart';
import 'package:tutor_flutter_app/domain/entities/course/book_entity.dart';
import 'package:tutor_flutter_app/domain/entities/course/category_entity.dart';

import '../../data/models/response/book_resp.dart';

part 'book_mapper.mapper.g.dart';

@Mapper()
abstract class BookMapper {
  BookEntity fromModel(Rows model);
  CategoryEntity fromCategory(Categories categories);
}
