import 'package:flutter_test/flutter_test.dart';
import 'package:singup_app/auth/datasource/model.dart';

import '../mocks/mock_auth_repository.dart';

void main() {
  group('AutoRepositry', () {
    final MockAutoRepo repo = MockAutoRepo();

    test('singleton check', () {
      expect(repo, MockAutoRepo());
    });

    //
    test('Login test', () async {
      expect(await repo.login(email: '', password: ''), null);

      final actual = await repo.login(
          email: 'nitish.gupta@spicemoney.com', password: '0123456789');

      final expected = User(
          email: "nitish.gupta@spicemoney.com",
          firstName: "Nitish Kumar",
          lastName: "Gupta");

      // expect(actual?.email, expected.email);
      // expect(actual?.firstName, expected.firstName);
      // expect(actual?.lastName, expected.lastName);
      expect(actual, expected);
    });
  });
}
