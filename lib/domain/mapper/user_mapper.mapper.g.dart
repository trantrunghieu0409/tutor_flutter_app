// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class UserMapperImpl extends UserMapper {
  UserMapperImpl() : super();

  @override
  UserEntity fromUser(User model) {
    final userentity = UserEntity(
      id: model.id,
      email: model.email,
      name: model.name,
      avatar: model.avatar,
      country: model.country,
      phone: model.phone,
      roles: model.roles.map((e) => e).toList(),
      language: model.language,
      birthday: model.birthday,
      isActivated: model.isActivated,
      walletInfo: fromWalletInfo(model.walletInfo),
      courses: model.courses.map((e) => e).toList(),
      requireNote: model.requireNote,
      level: model.level,
      learnTopics: model.learnTopics.map((x) => fromTopicEntity(x)).toList(),
      testPreparations: model.testPreparations.map((e) => e).toList(),
      isPhoneActivated: model.isPhoneActivated,
      timezone: model.timezone,
      studySchedule: model.studySchedule,
      canSendMessage: model.canSendMessage,
    );
    return userentity;
  }

  @override
  LearnTopicEntity fromTopicEntity(LearnTopic model) {
    final learntopicentity = LearnTopicEntity(
      id: model.id,
      key: model.key,
      name: model.name,
    );
    return learntopicentity;
  }

  @override
  WalletInfoEntity fromWalletInfo(WalletInfo model) {
    final walletinfoentity = WalletInfoEntity(
      amount: model.amount,
      isBlocked: model.isBlocked,
      bonus: model.bonus,
    );
    return walletinfoentity;
  }

  @override
  UpdateUserReq fromUserEntity(UserEntity user) {
    final updateuserreq = UpdateUserReq(
      name: user.name,
      country: user.country,
      phone: user.phone,
      birthday: user.birthday,
      level: user.level,
      studySchedule: user.studySchedule,
    );
    return updateuserreq;
  }
}
