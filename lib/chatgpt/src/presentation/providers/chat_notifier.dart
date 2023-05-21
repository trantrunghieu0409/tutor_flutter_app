import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/chatgpt/src/data/models/message_model.dart';
import 'package:tutor_flutter_app/chatgpt/src/domain/entities/message.dart';
import 'package:tutor_flutter_app/chatgpt/src/domain/usescases/chatgpt_usecase.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';

class ChatNotifier extends StateNotifier<List<Message>> {
  late ChatgptUsecase chatgptUsecase;

  ChatNotifier() : super([]) {
    chatgptUsecase = Injector.resolve<ChatgptUsecase>();
    init();
  }

  void init() async {
    state = await chatgptUsecase.getLocalMessages();
  }

  Future<void> add(String message) async {
    if (message.isEmpty) {
      return;
    }
    List<Message> messages = state;

    messages.add(MessageModel(role: Message.userRole, content: message));
    messages.add(await chatgptUsecase.sendMessage(messages));

    state = messages;

    chatgptUsecase.updateLocal(messages);
  }

  void clearHistory() {
    state = [];
    chatgptUsecase.clearHistory();
  }
}

final chatsProvider = StateNotifierProvider<ChatNotifier, List<Message>>((ref) {
  return ChatNotifier();
});
