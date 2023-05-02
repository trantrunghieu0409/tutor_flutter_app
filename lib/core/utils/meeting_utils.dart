import 'dart:convert';

Codec<String, String> stringToBase64 = utf8.fuse(base64);

class MeetingUtils {
  static String getRoom(String meetingUrl) {
    final base64Decoded = base64
        .decode(base64.normalize(meetingUrl.split("token=")[1].split(".")[1]));
    final urlObject = utf8.decode(base64Decoded);
    final jsonRes = json.decode(urlObject);
    return jsonRes['room'];
  }

  static String getToken(String meetingUrl) {
    return meetingUrl.split("token=")[1];
  }
}
