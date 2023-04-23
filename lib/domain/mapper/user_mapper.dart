import 'package:smartstruct/smartstruct.dart';
import 'package:tutor_flutter_app/data/models/response/login_resp.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/learn_topic_entity.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/wallet_info_entity.dart';

part 'user_mapper.mapper.g.dart';

@Mapper()
abstract class UserMapper {
  UserEntity fromUser(User model);
  LearnTopicEntity fromTopicEntity(LearnTopic model);
  WalletInfoEntity fromWalletInfo(WalletInfo model);
}
