import 'package:flutter_test/flutter_test.dart';
import 'package:singup_app/auth/datasource/auth_repository.dart';

void main() {
  group('AutoRepositry', () {
    final AuthRepository repo = MockAutoRepo();

    test('singleton check', () {
      expect(repo, MockAutoRepo());
    });
  });
}
