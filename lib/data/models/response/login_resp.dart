class LoginResp {
  LoginResp({
    required this.user,
    required this.tokens,
  });
  late final User user;
  late final Token tokens;

  LoginResp.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    tokens = Token.fromJson(json['tokens']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user.toJson();
    data['tokens'] = tokens.toJson();
    return data;
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

  User.fromJson(Map<String, dynamic> json) {
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
    courses = List.castFrom<dynamic, dynamic>(json['courses'] ?? []);
    requireNote = json['requireNote'];
    level = json['level'];
    learnTopics = List.from(json['learnTopics'])
        .map((e) => LearnTopic.fromJson(e))
        .toList();
    testPreparations =
        List.castFrom<dynamic, dynamic>(json['testPreparations']);
    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['avatar'] = avatar;
    data['country'] = country;
    data['phone'] = phone;
    data['roles'] = roles;
    data['language'] = language;
    data['birthday'] = birthday;
    data['isActivated'] = isActivated;
    data['walletInfo'] = walletInfo.toJson();
    data['courses'] = courses;
    data['requireNote'] = requireNote;
    data['level'] = level;
    data['learnTopics'] = learnTopics.map((e) => e.toJson()).toList();
    data['testPreparations'] = testPreparations;
    data['isPhoneActivated'] = isPhoneActivated;
    data['timezone'] = timezone;
    data['studySchedule'] = studySchedule;
    data['canSendMessage'] = canSendMessage;
    return data;
  }
}

class WalletInfo {
  WalletInfo({
    required this.amount,
    required this.isBlocked,
    required this.bonus,
  });
  late final String amount;
  late final bool isBlocked;
  late final int bonus;

  WalletInfo.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    isBlocked = json['isBlocked'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amount'] = amount;
    data['isBlocked'] = isBlocked;
    data['bonus'] = bonus;
    return data;
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

  LearnTopic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['name'] = name;
    return data;
  }
}

class Token {
  Token({
    required this.access,
    required this.refresh,
  });
  late final Access access;
  late final Refresh refresh;

  Token.fromJson(Map<String, dynamic> json) {
    access = Access.fromJson(json['access']);
    refresh = Refresh.fromJson(json['refresh']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access'] = access.toJson();
    data['refresh'] = refresh.toJson();
    return data;
  }
}

class Access {
  Access({
    required this.token,
    required this.expires,
  });
  late final String token;
  late final String expires;

  Access.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['expires'] = expires;
    return data;
  }
}

class Refresh {
  Refresh({
    required this.token,
    required this.expires,
  });
  late final String token;
  late final String expires;

  Refresh.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['expires'] = expires;
    return data;
  }
}
