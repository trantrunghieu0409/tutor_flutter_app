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
    this.country,
    required this.phone,
    required this.roles,
    this.language,
    this.birthday,
    required this.isActivated,
    required this.walletInfo,
    required this.courses,
    this.requireNote,
    this.level,
    required this.learnTopics,
    required this.testPreparations,
    required this.isPhoneActivated,
    this.timezone,
    this.studySchedule,
    required this.canSendMessage,
  });
  late final String id;
  late final String email;
  late final String name;
  late final String avatar;
  late final String? country;
  late final String phone;
  late final List<String> roles;
  late final String? language;
  late final String? birthday;
  late final bool isActivated;
  late final WalletInfo walletInfo;
  late final List<dynamic> courses;
  late final String? requireNote;
  late final String? level;
  late final List<LearnTopic> learnTopics;
  late final List<dynamic> testPreparations;
  late final bool isPhoneActivated;
  late final int? timezone;
  late final String? studySchedule;
  late final bool canSendMessage;
  late final TutorInfo? tutorInfo;

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
    tutorInfo = json['tutorInfo'] != null
        ? TutorInfo.fromJson(json['tutorInfo'])
        : null;
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
    data['tutorInfo'] = tutorInfo != null ? tutorInfo!.toJson() : null;
    return data;
  }
}

class TutorInfo {
  TutorInfo({
    required this.id,
    required this.video,
    required this.bio,
    required this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    required this.interests,
    this.languages,
    this.specialties,
    this.resume,
    required this.rating,
    required this.isActivated,
    required this.isNative,
  });
  late final String id;
  late final String video;
  late final String bio;
  late final String education;
  late final String? experience;
  late final String? profession;
  late final String? accent;
  late final String? targetStudent;
  late final String interests;
  late final String? languages;
  late final String? specialties;
  late final String? resume;
  late final int rating;
  late final bool isActivated;
  late final bool isNative;

  TutorInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = null;
    profession = null;
    accent = null;
    targetStudent = null;
    interests = json['interests'];
    languages = null;
    specialties = null;
    resume = null;
    rating = json['rating'] is int
        ? json['rating']
        : double.parse(json['rating']).round();
    isActivated = json['isActivated'];
    isNative = json['isNative'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['video'] = video;
    data['bio'] = bio;
    data['education'] = education;
    data['experience'] = experience;
    data['profession'] = profession;
    data['accent'] = accent;
    data['targetStudent'] = targetStudent;
    data['interests'] = interests;
    data['languages'] = languages;
    data['specialties'] = specialties;
    data['resume'] = resume;
    data['rating'] = rating;
    data['isActivated'] = isActivated;
    data['isNative'] = isNative;
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
