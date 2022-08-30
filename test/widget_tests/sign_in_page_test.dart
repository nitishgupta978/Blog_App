import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:singup_app/auth/screens/login_page.dart';
import 'package:singup_app/common/widgets/input_field.dart';
import 'package:singup_app/di.dart';

import '../mocks/mock_auth_repository.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

// class MockValidators with Validators {}

void main() {
  testWidgets('Login Page', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final mockObserver = MockNavigatorObserver();
    // await tester.pumpWidget(ProviderScope(overrides: [authRepoProvider.overrideWithValue(mockAuthRepo)],));
    // child:MaterialApp(home: const LoginPage(title: '',),navigatorObservers: [mockObserver],);,
    //

    await tester.pumpWidget(ProviderScope(
      overrides: [authRepoProvider.overrideWithValue(mockAuthRepo)],
      child: MaterialApp(
        home: const LoginPage(
          title: '',
        ),
        navigatorObservers: [mockObserver],
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
    //
    //
    await tester.tap(find.byKey(const ValueKey('login_submit_button')));
    await tester.pumpAndSettle();
    expect(find.text('User not found', skipOffstage: false), findsNothing);

    await tester.enterText(
        find.byKey(const ValueKey('password_input_fields')), 'abcdefghij');
    await tester.pumpAndSettle(const Duration(milliseconds: 200));
    await tester.tap(find.byKey(const ValueKey('login_submit_button')));
    await tester.pumpAndSettle();
    expect(find.text('User not found', skipOffstage: false), findsOneWidget);
    //
    //
    await tester.enterText(emailInput, 'nitish.gupta@spicemoney.com');
    await tester.enterText(
        find.byKey(const ValueKey('password_input_fields')), '0123456789');
    await tester.pumpAndSettle(const Duration(milliseconds: 200));
    await tester.tap(find.byKey(const ValueKey('login_submit_button')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // verify(bloc.signIn());
    verify(mockObserver.didReplace(
        newRoute: anyNamed('newRoute'), oldRoute: anyNamed('oldRoute')));
  });
}

Finder get emailInput => find.byKey(const ValueKey('email_input_field'));
