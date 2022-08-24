import 'dart:convert';

import '../../common/network_client/network_client.dart';
import 'model.dart';

class AuthRepository {
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
  User? get currentUser => _user;

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

class MockAutoRepo implements AuthRepository {
  @override
  final INetworkClient _iNetworkClient;
  static MockAutoRepo? _instance;

  MockAutoRepo._(this._iNetworkClient); // Private Constructor
  factory MockAutoRepo() {
    _instance ??=
        MockAutoRepo._(MockNetworkClint()); // ??= is called Elvis Operator
    return _instance!;
  }
  @override
  User? _user;

  @override
  User? get currentUser => throw UnimplementedError();

  @override
  Future<User?> login({required String email, required String password}) async {
    if (email == "nitish.gupta@spicemoney.com" && password == "0123456789") {
      return User(
          email: "nitish.gupta@spicemoney.com",
          firstName: "Nitish Kumar",
          lastName: "Gupta");
    }
    return null;
  }

  @override
  Future<bool> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    return true;
  }
}
