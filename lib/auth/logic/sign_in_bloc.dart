import 'package:rxdart/rxdart.dart';
import 'package:singup_app/auth/datasource/auth_repository.dart';
import 'package:singup_app/auth/logic/validators.dart';
import 'package:singup_app/common/observable/observable.dart';

// Bloc => Business Logic Component
// Bloc -> Statemanagement (library), Bloc -> Design pattern
class SignInBloc with Validators {
  SignInBloc() {
    email = Observable(validator: validateEmail);
    password = Observable(validator: validatePassword);
    passwordObscure = Observable.seeded(true);
  }

  late final Observable<String?> email;
  late final Observable<String?> password;
  late final Observable<bool> passwordObscure;

  Stream<bool> get validInputObs$ =>
      Rx.combineLatest2(email.obs$, password.obs$, (a, b) => true);

// Rx depend on rxdart dependancy

  Future<bool> signIn() async {
    final user = await AuthRepository()
        .login(email: email.value!, password: password.value!);
    return user != null;
  }

  void dispose() {
    email.dispose();
    password.dispose();
    passwordObscure.dispose();
  }
}
