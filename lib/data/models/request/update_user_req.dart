class UpdateUserReq {
  UpdateUserReq({
    required this.name,
    this.country,
    required this.phone,
    this.birthday,
    this.level,
    required this.studySchedule,
  });
  late final String name;
  late final String? country;
  late final String phone;
  late final String? birthday;
  late final String? level;
  late final String? studySchedule;

  UpdateUserReq.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    phone = json['phone'];
    birthday = json['birthday'];
    level = json['level'];
    studySchedule = json['studySchedule'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['country'] = country;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['level'] = level;
    data['studySchedule'] = studySchedule;
    return data;
  }
}
