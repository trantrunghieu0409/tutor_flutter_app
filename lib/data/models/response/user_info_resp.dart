import 'package:tutor_flutter_app/data/models/response/login_resp.dart';

class UserInfoResp {
  UserInfoResp({
    required this.user,
  });
  late final User user;

  UserInfoResp.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user.toJson();
    return data;
  }
}
