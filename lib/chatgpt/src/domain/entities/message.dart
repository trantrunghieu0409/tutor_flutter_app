class Message {
  late String role;
  late String content;

  static String userRole = "user";
  static String chatgptRole = "assistant";

  Message({required this.role, required this.content});

  bool get isUser => role == userRole;

  bool get isChatGpt => role == chatgptRole;
}
