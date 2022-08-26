import 'model.dart';

abstract class IAuthRepository {
  User? get currentUser;
  Future<User?> login({required String email, required String password});
  Future<bool> signUp({
    required String email,
    required String password,
    required String firstName,
  });
}
