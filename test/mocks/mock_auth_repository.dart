import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:singup_app/auth/datasource/i_auth_repository.dart';
import 'package:singup_app/auth/datasource/model.dart';

import 'mock_auth_repository.mocks.dart';

@GenerateMocks([IAuthRepository])
final mockAuthRepo = createRepo();

MockIAuthRepository createRepo() {
  final repo = MockIAuthRepository();

  when(repo.login()).thenAnswer((realInvocation) async {
    if (realInvocation.namedArguments['email'] ==
            "nitish.gupta@spicemoney.com" &&
        realInvocation.namedArguments['password'] == "0123456789") {
      return User(
          email: "nitish.gupta@spicemoney.com",
          firstName: "Nitish Kumar",
          lastName: "Gupta");
    }
    return null;
  });

  return repo;
}
// import 'package:singup_app/auth/datasource/auth_repository.dart';
// import 'package:singup_app/auth/datasource/model.dart';

// //dumy logic or status for testing
// class MockAutoRepo implements AuthRepository {
//   static MockAutoRepo? _instance;

//   MockAutoRepo._(); // Private Constructor
//   factory MockAutoRepo() {
//     _instance ??= MockAutoRepo._(); // ??= is called Elvis Operator
//     return _instance!;
//   }
//   // User? _user;

//   // @override
//   // User? get currentUser => _user;

//   @override
//   Future<User?> login({required String email, required String password}) async {
//     if (email == "nitish.gupta@spicemoney.com" && password == "0123456789") {
//       _user = User(
//           email: "nitish.gupta@spicemoney.com",
//           firstName: "Nitish Kumar",
//           lastName: "Gupta");
//       return _user;
//     }
//     return null;
//   }

//   @override
//   Future<bool> signUp(
//       {required String email,
//       required String password,
//       required String firstName,
//       required String lastName}) async {
//     return true;
//   }
// }
