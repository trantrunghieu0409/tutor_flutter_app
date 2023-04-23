class LoginResp {
  LoginResp({
    required this.user,
    required this.tokens,
  });
  late final User user;
  late final Tokens tokens;
  
  LoginResp.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    tokens = Tokens.fromJson(json['tokens']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['tokens'] = tokens.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.country,
    required this.phone,
    required this.roles,
     this.language,
    required this.birthday,
    required this.isActivated,
    required this.walletInfo,
    required this.courses,
    required this.requireNote,
    required this.level,
    required this.learnTopics,
    required this.testPreparations,
    required this.isPhoneActivated,
    required this.timezone,
     this.studySchedule,
    required this.canSendMessage,
  });
  late final String id;
  late final String email;
  late final String name;
  late final String avatar;
  late final String country;
  late final String phone;
  late final List<String> roles;
  late final String? language;
  late final String birthday;
  late final bool isActivated;
  late final WalletInfo walletInfo;
  late final List<dynamic> courses;
  late final String requireNote;
  late final String level;
  late final List<LearnTopic> learnTopics;
  late final List<dynamic> testPreparations;
  late final bool isPhoneActivated;
  late final int timezone;
  late final String? studySchedule;
  late final bool canSendMessage;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    roles = List.castFrom<dynamic, String>(json['roles']);
    language = json['language'];
    birthday = json['birthday'];
    isActivated = json['isActivated'];
    walletInfo = WalletInfo.fromJson(json['walletInfo']);
    courses = List.castFrom<dynamic, dynamic>(json['courses']);
    requireNote = json['requireNote'];
    level = json['level'];
    learnTopics = List.from(json['learnTopics']).map((e)=>LearnTopic.fromJson(e)).toList();
    testPreparations = List.castFrom<dynamic, dynamic>(json['testPreparations']);
    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    studySchedule = null;
    canSendMessage = json['canSendMessage'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['name'] = name;
    _data['avatar'] = avatar;
    _data['country'] = country;
    _data['phone'] = phone;
    _data['roles'] = roles;
    _data['language'] = language;
    _data['birthday'] = birthday;
    _data['isActivated'] = isActivated;
    _data['walletInfo'] = walletInfo.toJson();
    _data['courses'] = courses;
    _data['requireNote'] = requireNote;
    _data['level'] = level;
    _data['learnTopics'] = learnTopics.map((e)=>e.toJson()).toList();
    _data['testPreparations'] = testPreparations;
    _data['isPhoneActivated'] = isPhoneActivated;
    _data['timezone'] = timezone;
    _data['studySchedule'] = studySchedule;
    _data['canSendMessage'] = canSendMessage;
    return _data;
  }
}

class WalletInfo {
  WalletInfo({
    required this.id,
    required this.userId,
    required this.amount,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    required this.bonus,
  });
  late final String id;
  late final String userId;
  late final String amount;
  late final bool isBlocked;
  late final String createdAt;
  late final String updatedAt;
  late final int bonus;
  
  WalletInfo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['userId'];
    amount = json['amount'];
    isBlocked = json['isBlocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userId'] = userId;
    _data['amount'] = amount;
    _data['isBlocked'] = isBlocked;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['bonus'] = bonus;
    return _data;
  }
}

class LearnTopic {
  LearnTopic({
    required this.id,
    required this.key,
    required this.name,
  });
  late final int id;
  late final String key;
  late final String name;
  
  LearnTopic.fromJson(Map<String, dynamic> json){
    id = json['id'];
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['key'] = key;
    _data['name'] = name;
    return _data;
  }
}

class Tokens {
  Tokens({
    required this.access,
    required this.refresh,
  });
  late final Access access;
  late final Refresh refresh;
  
  Tokens.fromJson(Map<String, dynamic> json){
    access = Access.fromJson(json['access']);
    refresh = Refresh.fromJson(json['refresh']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['access'] = access.toJson();
    _data['refresh'] = refresh.toJson();
    return _data;
  }
}

class Access {
  Access({
    required this.token,
    required this.expires,
  });
  late final String token;
  late final String expires;
  
  Access.fromJson(Map<String, dynamic> json){
    token = json['token'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['expires'] = expires;
    return _data;
  }
}

class Refresh {
  Refresh({
    required this.token,
    required this.expires,
  });
  late final String token;
  late final String expires;
  
  Refresh.fromJson(Map<String, dynamic> json){
    token = json['token'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['expires'] = expires;
    return _data;
  }
}