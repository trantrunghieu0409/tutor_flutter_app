// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_flutter_app/core/utils/string_utils.dart';

void main() {
  group('Email', () {
    test('shoud return true if input is a valid email', () {
      String email = "example@gmail.com";
      expect(StringUtils.isValidEmail(email), true);
    });

    test('shoud return false if input is an invalid email', () {
      String email = "example@gmail";
      expect(StringUtils.isValidEmail(email), false);
    });
  });
}
