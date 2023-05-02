class LettutorConfig {
  // endpoint
  static String endpoint = "https://sandbox.api.lettutor.com/";

  static String jitsiServerUrl = "https://meet.lettutor.com";

  // authen - path
  static String login = "auth/login";
  static String register = 'auth/register';
  static String forgotPassword = 'user/forgotPassword';

  // user -path
  static String getUserInfo = "user/info";
  static String putUserInfo = "user/info";
  static String uploadAvatar = "user/uploadAvatar";

  // tutor - path
  static String getAllTutors = 'tutor/more?perPage=10&page=1';
  static String searchTutors = 'tutor/search';

  // schedule - patj
  static String scheduleByTutorIdPath = 'schedule';
  static String bookSchedule = 'booking';

  // history - path
  static String getHistory = 'booking/list/student';
  static String getTotalLessonTime = 'call/total';

  // past history - path
  static String getPastHistory = 'call/history';

  // course - path
  static String getCourses = 'course';
  static String getEBooks = 'e-book';

  // hard-coded value for authorization
  static String token =
      '''Bearer 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''';
}
