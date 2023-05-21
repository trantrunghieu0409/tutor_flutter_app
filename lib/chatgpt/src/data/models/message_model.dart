import 'package:tutor_flutter_app/chatgpt/src/domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel({required String role, required String content})
      : super(role: role, content: content);

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      MessageModel(role: json['role'], content: json['content']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['content'] = content;
    return data;
  }

  MessageModel.castFromEntity(final Message message)
      : super(role: message.role, content: message.content);
}
