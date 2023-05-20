import 'package:smartstruct/smartstruct.dart';
import 'package:tutor_flutter_app/data/models/response/login_resp.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/token_entity.dart';

part 'token_mapper.mapper.g.dart';

@Mapper()
abstract class TokenMapper {
  TokenEntity fromAccessModel(Access model);
  TokenEntity fromRefreshModel(Refresh model);
}
