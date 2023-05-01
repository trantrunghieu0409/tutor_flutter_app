import 'package:tutor_flutter_app/chatgpt/src/data/datasources/local/chatgpt_datasource.dart';
import 'package:tutor_flutter_app/chatgpt/src/data/datasources/remote/chatgpt_datasource.dart';
import 'package:tutor_flutter_app/chatgpt/src/data/models/chat_model.dart';
import 'package:tutor_flutter_app/chatgpt/src/data/models/message_model.dart';

class ChatgptRepository {
  final ChatgptRemoteDatasource chatgptRemoteDatasource;
  final ChatgptLocalDatasource chatgptLocalDatasource;

  ChatgptRepository(
      {required this.chatgptRemoteDatasource,
      required this.chatgptLocalDatasource});

  Future<List<MessageModel>> getLocalMessages() async {
    return await chatgptLocalDatasource.get();
  }

  Future<ChatModel> sendMessages(List<MessageModel> messages) async {
    final ChatModel response =
        await chatgptRemoteDatasource.sendMessages(messages);

    return response;
  }

  Future<void> persist(List<MessageModel> messages) async {
    if (messages.isNotEmpty) {
      await chatgptLocalDatasource.persist(messages);
    }
  }

  Future<void> remove() async {
    return await chatgptLocalDatasource.remove();
  }
}
