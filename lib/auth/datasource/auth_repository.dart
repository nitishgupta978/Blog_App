import 'dart:convert';

import 'package:singup_app/auth/datasource/i_auth_repository.dart';
import 'package:singup_app/auth/datasource/model.dart';
import 'package:singup_app/common/network_client/network_client.dart';

class AuthRepository implements IAuthRepository {
  final INetworkClient _iNetworkClient;

  AuthRepository(this._iNetworkClient); // Private Constructor

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
