import 'dart:convert';

import '../../common/network_client/network_client.dart';
import 'model.dart';

class AuthRepository {
  static AuthRepository? _instance;
  AuthRepository._(); // Private Constructor
  factory AuthRepository() {
    _instance ??= AuthRepository._(); // ??= is called Elvis Operator
    return _instance!;
  }

  User? _user;
  User? get currentUser => _user;

  Future<User?> login({required String email, required String password}) async {
    final response = await NetworkClient.post(
      'login',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      _user = User.fromJson(json.decode(response.body));
    }

    return _user;
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    // required String samePassword,
  }) async {
    final response = await NetworkClient.post(
      'signup',
      data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'againPassowrd': password,
      },
    );

    return response.statusCode == 200;
  }
}
