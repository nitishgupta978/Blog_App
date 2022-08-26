import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:singup_app/auth/datasource/model.dart';

void main() {
  group('User test', () {
    test('.fromJson', () {
      const jsonStr =
          '{"email":"abc@xyz.com", "first name":"ABCD","last name":"xyz"}';
      final json = jsonDecode(jsonStr);
      expect(json,
          allOf([isNotNull, isA<Map<String, dynamic>>(), contains('email')]));
      final user = User.fromJson(json);
      expect(user.email, 'abc@xyz.com');
      expect(user.firstName, 'ABCD');
      expect(user.lastName, 'xyz');

      final user2 = User.fromJson(json);
      expect(user, user2);
    });
  });
}
