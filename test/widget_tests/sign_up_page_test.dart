import 'package:flutter/widgets.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:singup_app/auth/logic/sign_up_bloc.dart';
import 'package:singup_app/auth/logic/validators.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockValidators with Validators {}

@GenerateMocks([SignUpBloc])
void main() {}
