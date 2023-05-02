import 'package:tutor_flutter_app/core/utils/image_utils.dart';

class Language {
  late String country;
  late String flag;
  late String code;
  late String locale;

  Language(
      {required this.country,
      required this.flag,
      required this.code,
      required this.locale});

  static final Language vietnamese = Language(
      country: "Tiếng Việt",
      flag: ImageUtils.vnFlag,
      code: "vi-VN",
      locale: "vi");
  static final Language english = Language(
      country: "English",
      flag: ImageUtils.englishFlag,
      code: "en-US",
      locale: 'en');
  static final _languages = [vietnamese, english];
  static List<Language> get languages => _languages;
}
