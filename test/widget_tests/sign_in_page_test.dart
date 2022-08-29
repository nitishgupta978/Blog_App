import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:singup_app/auth/logic/sign_in_bloc.dart';
import 'package:singup_app/auth/logic/validators.dart';
import 'package:singup_app/auth/screens/login_page.dart';
import 'package:singup_app/common/observable/observable.dart';
import 'package:singup_app/common/widgets/input_field.dart';

import 'sign_in_page_test.mocks.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockValidators with Validators {}

@GenerateMocks([SignInBloc])
void main() {
  testWidgets('Login Page', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final bloc = MockSignInBloc();
    final mockValidators = MockValidators();
    when(bloc.email)
        .thenReturn(Observable(validator: mockValidators.validateEmail));
    when(bloc.password)
        .thenReturn(Observable(validator: mockValidators.validatePassword));
    when(bloc.passwordObscure).thenReturn(Observable.seeded(true));
    when(bloc.validInputObs$).thenAnswer((_) =>
        Rx.combineLatest2(bloc.email.obs$, bloc.password.obs$, (a, b) => true));
    when(bloc.signIn()).thenAnswer((_) => Future.value(
        bloc.email.value == 'nitish.gupta@spicemoney.com' &&
            bloc.password.value == '0123456789'));
    //
    //

    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
      home: const LoginPage(
        title: '',
      ),
      navigatorObservers: [mockObserver],
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

    verify(bloc.signIn());
    verify(mockObserver.didReplace(
        newRoute: anyNamed('newRoute'), oldRoute: anyNamed('oldRoute')));
  });
}

Finder get emailInput => find.byKey(const ValueKey('email_input_field'));
