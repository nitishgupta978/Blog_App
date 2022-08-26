import 'dart:convert';

import 'package:singup_app/auth/datasource/i_auth_repository.dart';
import 'package:singup_app/auth/datasource/model.dart';
import 'package:singup_app/common/network_client/network_client.dart';

class AuthRepository implements IAuthRepository {
  final INetworkClient _iNetworkClient;
  static AuthRepository? _instance;
  AuthRepository._(this._iNetworkClient); // Private Constructor
  factory AuthRepository() {
    _instance ??=
        AuthRepository._(NetworkClient()); // ??= is called Elvis Operator
    return _instance!;
  }
  factory AuthRepository.mock() {
    _instance ??=
        AuthRepository._(MockNetworkClint()); // ??= is called Elvis Operator
    return _instance!;
  }

  User? _user;
  @override
  User? get currentUser => _user;

  @override
  Future<User?> login({required String email, required String password}) async {
    final response = await _iNetworkClient.post(
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

  @override
  Future<bool> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final response = await _iNetworkClient.post(
      'signup',
      data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        // 'againPassowrd': password,
      },
    );

    return response.statusCode == 200;
  }
}
