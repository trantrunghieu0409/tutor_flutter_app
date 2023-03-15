import 'dart:convert';

Codec<String, String> stringToBase64 = utf8.fuse(base64);

String fetchInstantMeetingUrl(String groupChatId) {
  String meetingCredentials = groupChatId;
  String encodedMeetingCredentials = stringToBase64.encode(meetingCredentials);
  return 'meet.jit.si/$encodedMeetingCredentials';
}
