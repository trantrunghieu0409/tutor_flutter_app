import 'package:tutor_flutter_app/chatgpt/src/data/models/message_model.dart';

class ChoiceModel {
  late MessageModel message;
  late String finishReason;
  late int index;

  ChoiceModel(
      {required this.message, required this.finishReason, required this.index});

  ChoiceModel.fromJson(Map<String, dynamic> json) {
    message = (json['message'] != null
        ? MessageModel.fromJson(json['message'])
        : null)!;
    finishReason = json['finish_reason'];
    index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message.toJson();
    data['finish_reason'] = finishReason;
    data['index'] = index;
    return data;
  }
}
