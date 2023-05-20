import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/token_entity.dart';

class AccountLocalDatasource {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveToken(TokenEntity token) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('token', token.token);
    await prefs.setString('expires', token.expires);
  }

  Future<TokenEntity> getToken() async {
    final SharedPreferences prefs = await _prefs;
    String? token = prefs.getString('token');
    String? expires = prefs.getString('expires');
    return TokenEntity(token: token ?? "", expires: expires ?? "");
  }
}
