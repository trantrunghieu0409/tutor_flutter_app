import 'package:tutor_flutter_app/chatgpt/src/data/models/choice_modal.dart';
import 'package:tutor_flutter_app/chatgpt/src/data/models/uasge_model.dart';

class ChatModel {
  late String id;
  late String object;
  late int created;
  late String model;
  late UsageModel usage;
  late List<ChoiceModel> choices;

  ChatModel(
      {required this.id,
      required this.object,
      required this.created,
      required this.model,
      required this.usage,
      required this.choices});

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    usage =
        (json['usage'] != null ? UsageModel.fromJson(json['usage']) : null)!;
    if (json['choices'] != null) {
      choices = <ChoiceModel>[];
      json['choices'].forEach((v) {
        choices.add(ChoiceModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['created'] = created;
    data['model'] = model;
    data['usage'] = usage.toJson();
    data['choices'] = choices.map((v) => v.toJson()).toList();
    return data;
  }
}
