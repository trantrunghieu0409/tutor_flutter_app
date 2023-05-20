import 'package:smartstruct/smartstruct.dart';
import 'package:tutor_flutter_app/data/models/request/update_user_req.dart';
import 'package:tutor_flutter_app/data/models/response/login_resp.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/learn_topic_entity.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/second_tutor_info_entity.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/wallet_info_entity.dart';

part 'user_mapper.mapper.g.dart';

@Mapper()
abstract class UserMapper {
  UserEntity fromUser(User model);
  SecondTutorInfoEntity fromTutorInfo(TutorInfo tutorInfo);
  LearnTopicEntity fromTopicEntity(LearnTopic model);
  WalletInfoEntity fromWalletInfo(WalletInfo model);

  UpdateUserReq fromUserEntity(UserEntity user);
}
