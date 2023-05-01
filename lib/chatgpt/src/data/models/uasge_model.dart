class UsageModel {
  late int promptTokens;
  late int completionTokens;
  late int totalTokens;

  UsageModel(
      {required this.promptTokens,
      required this.completionTokens,
      required this.totalTokens});

  UsageModel.fromJson(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prompt_tokens'] = promptTokens;
    data['completion_tokens'] = completionTokens;
    data['total_tokens'] = totalTokens;
    return data;
  }
}
