import 'package:collection/collection.dart';

enum SpecialityEnum {
  englishForKids("English for kids", "english-for-kids"),
  englishForBusiness("English for Business", "business-english"),
  conversational("Conversational", "conversational-english"),
  staters("STARTERES", 'starters'),
  movers("MOVERS", "movers"),
  flyers("FLYERS", "flyers"),
  ket("KET", "ket"),
  pet("PET", "pet"),
  ielts("IELTS", "ielts"),
  toelf("TOELF", "toefl"),
  toeic("TOEIC", "toeic");

  final String value;
  final String filterKey;

  const SpecialityEnum(this.value, this.filterKey);

  static String getValue(String key) {
    var val = SpecialityEnum.values
        .firstWhereOrNull((element) => element.filterKey == key);
    return val != null ? val.value : key;
  }
}
