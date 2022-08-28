import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:singup_app/auth/screens/login_page.dart';
import 'package:singup_app/common/widgets/input_field.dart';

void main() {
  testWidgets('Login Page', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginPage(
        title: '',
      ),
    ));
    final titelFinder = find.text('Sign In');
    expect(titelFinder, findsOneWidget);
    //
    final emailInputStreamBuilder =
        find.byKey(const ValueKey('email_input_field_builder'));

    final emailInput = find.descendant(
        of: emailInputStreamBuilder, matching: find.byType(InputField));
    //
    // for not vaild email
    await tester.enterText(emailInput, 'ABC');
    await tester.pumpAndSettle();
    expect(find.text('ABC'), findsOneWidget);
    expect(
        tester.widget<InputField>(emailInput).errorText, 'Not a valid email');
    //

    // for vaild email
    await tester.enterText(emailInput, 'nitish01@gmail.com');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('nitish01@gmail.com'), findsOneWidget);
    expect(tester.widget<InputField>(emailInput).errorText, null);
  });
}
