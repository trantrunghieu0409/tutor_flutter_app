import 'package:tutor_flutter_app/chatgpt/src/data/models/chat_model.dart';
import 'package:tutor_flutter_app/chatgpt/src/data/models/message_model.dart';
import 'package:tutor_flutter_app/chatgpt/src/data/repositories/chatgpt_repository.dart';
import 'package:tutor_flutter_app/chatgpt/src/domain/entities/message.dart';

class ChatgptUsecase {
  late ChatgptRepository chatgptRepository;

  ChatgptUsecase({required this.chatgptRepository});

  Future<List<Message>> getLocalMessages() async {
    return await chatgptRepository.getLocalMessages();
  }

  Future<Message> sendMessage(List<Message> messages) async {
    List<MessageModel> messageModels = messages.reversed
        .take(10)
        .map((e) => MessageModel.castFromEntity(e))
        .toList()
        .reversed
        .toList();
    ChatModel response = await chatgptRepository.sendMessages(messageModels);
    return response.choices[0].message;
  }

  Future<void> updateLocal(List<Message> messages) async {
    await chatgptRepository
        .persist(messages.map((e) => MessageModel.castFromEntity(e)).toList());
  }

  Future<void> clearHistory() async {
    await chatgptRepository.remove();
  }
}
