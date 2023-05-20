import 'package:collection/collection.dart';

enum LevelEnum {
  BEGINNER("Pre A1 (Beginner)", "BEGINNER"),
  HIGHER_BEGINNER("A1 (Higher Beginner)", "HIGHER_BEGINNER"),
  PRE_INTERMEDIATE("A2 (Pre-Intermediate)", "PRE_INTERMEDIATE"),
  INTERMEDIATE("B1 (Intermediate)", "INTERMEDIATE"),
  UPPER_INTERMEDIATE("B2 (Upper Intermediate)", "UPPER_INTERMEDIATE"),
  ADVANCED("C1 (Advanced)", "ADVANCED"),
  PROFICIENCY("C2 (Proficiency)", 'PROFICIENCY');

  final String value;
  final String filterKey;

  const LevelEnum(this.value, this.filterKey);

  static String getValue(String key) {
    var val = LevelEnum.values
        .firstWhereOrNull((element) => element.filterKey == key);
    return val != null ? val.value : key;
  }

  static String getFilterKey(String value) {
    var val =
        LevelEnum.values.firstWhereOrNull((element) => element.value == value);
    return val != null ? val.filterKey : value;
  }
}
