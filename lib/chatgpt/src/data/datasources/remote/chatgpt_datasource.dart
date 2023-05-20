import 'dart:convert';

import 'package:tutor_flutter_app/chatgpt/src/common/config/chatgpt_config.dart';
import 'package:tutor_flutter_app/chatgpt/src/common/http/http_client.dart';
import 'package:tutor_flutter_app/chatgpt/src/data/models/chat_model.dart';
import 'package:tutor_flutter_app/chatgpt/src/data/models/message_model.dart';

class ChatgptRemoteDatasource {
  final ChatGptHttpClient httpClient;

  ChatgptRemoteDatasource({required this.httpClient});

  Future<ChatModel> sendMessages(List<MessageModel> messages) async {
    final Map<String, dynamic> data = await httpClient.post(
        path: ChatgptConfig.chatPath,
        body: jsonEncode({
          "model": ChatgptConfig.modelId,
          "messages": messages.map((v) => v.toJson()).toList()
        }));

    return ChatModel.fromJson(data);
  }
}
