import 'package:rxdart/rxdart.dart';
import 'package:singup_app/auth/datasource/i_auth_repository.dart';
import 'package:singup_app/auth/logic/validators.dart';
import 'package:singup_app/common/observable/observable.dart';

// Bloc => Business Logic Component
// Bloc -> Statemanagement (library), Bloc -> Design pattern
class SignInBloc with Validators {
  final IAuthRepository _repository;

  late final Observable<String?> email = Observable(validator: validateEmail);
  late final Observable<String?> password =
      Observable(validator: validatePassword);
  late final Observable<bool> passwordObscure = Observable.seeded(true);

  SignInBloc(this._repository);

  Stream<bool> get validInputObs$ =>
      Rx.combineLatest2(email.obs$, password.obs$, (a, b) => true);

// Rx depend on rxdart dependancy

  Future<bool> signIn() async {
    final user =
        await _repository.login(email: email.value!, password: password.value!);
    return user != null;
  }

  void dispose() {
    email.dispose();
    password.dispose();
    passwordObscure.dispose();
  }
}
