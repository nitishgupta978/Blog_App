import 'package:flutter_test/flutter_test.dart';
import 'package:singup_app/auth/logic/validators.dart';

void main() {
  group('Email validation on string?', () {
    test('.validateAsEmail() on null', () {
      expect(null.validateAsEmail(), null);
    });
    test('.validateAsEmail() on empty String', () {
      expect(''.validateAsEmail(),
          'Not a valid email'); //the value of in single quarts shoukd be same in validateAsEmail return,
    });
    test('.validemailAsEmail() ', () {
      expect('nitish'.validateAsEmail(), 'Not a valid email');
      expect('nitish.com'.validateAsEmail(), 'Not a valid email');
      expect('nitish.com'.validateAsEmail(), 'Not a valid email');
      expect('nitish@01.com'.validateAsEmail(), null);
    });
    test('.validemailAsEmail() on non-empty String symbols ', () {
      expect('nitish'.validateAsEmail(), 'Not a valid email');
      expect('nitish.com'.validateAsEmail(), 'Not a valid email');
      expect('nitish.com'.validateAsEmail(), 'Not a valid email');
    });
    test('.validemailAsEmail() on valid string email ', () {
      expect('nitish@01.com'.validateAsEmail(), null);
    });
  });

  ///
  group('LoginPassword  validation on string?', () {
    test('.validateAsPassword() on null', () {
      expect(null.validateAsPassword(), null);
    });
    test('.validateAsPassword() on empty String', () {
      expect(''.validateAsPassword(),
          'Password must be of atleast 8 characters'); //the value of in single quarts shoukd be same in validateAsEmail return,
    });
    test('.validateAsPassword() on non-empty string passwords ', () {
      expect('nitish'.validateAsPassword(),
          'Password must be of atleast 8 characters');
      expect('Niti01'.validateAsPassword(),
          'Password must be of atleast 8 characters');
      expect('niTin0'.validateAsPassword(),
          'Password must be of atleast 8 characters');
    });
    test('.validateAsPassword() on a string less than 8 ', () {
      expect('nitish'.validateAsPassword(),
          'Password must be of atleast 8 characters');
      expect('nit01'.validateAsPassword(),
          'Password must be of atleast 8 characters');
      expect('niti#'.validateAsPassword(),
          'Password must be of atleast 8 characters');
    });
    test('.validateAsPassword() on valid string email ', () {
      expect('nitish@01.com'.validateAsPassword(), null);
      expect('nit012h@01.com'.validateAsPassword(), null);
    });
  });
}
