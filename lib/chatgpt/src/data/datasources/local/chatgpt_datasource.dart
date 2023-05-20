import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutor_flutter_app/chatgpt/src/data/models/message_model.dart';

class ChatgptLocalDatasource {
  String key = 'messages';

  Future<List<MessageModel>> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = prefs.getStringList(key) ?? [];
    return res.map((e) => MessageModel.fromJson(jsonDecode(e))).toList();
  }

  Future<void> persist(List<MessageModel> messages) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        key, messages.map((e) => jsonEncode(e.toJson())).toList());
  }

  Future<void> remove() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
