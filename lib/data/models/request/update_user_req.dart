class UpdateUserReq {
  UpdateUserReq({
    required this.name,
    required this.country,
    required this.phone,
    required this.birthday,
    required this.level,
    required this.studySchedule,
  });
  late final String name;
  late final String country;
  late final String phone;
  late final String birthday;
  late final String level;
  late final String? studySchedule;
  
  UpdateUserReq.fromJson(Map<String, dynamic> json){
    name = json['name'];
    country = json['country'];
    phone = json['phone'];
    birthday = json['birthday'];
    level = json['level'];
    studySchedule = json['studySchedule'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['country'] = country;
    _data['phone'] = phone;
    _data['birthday'] = birthday;
    _data['level'] = level;
    _data['studySchedule'] = studySchedule;
    return _data;
  }
}