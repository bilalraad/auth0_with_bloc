import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oauth_with_bloc/data/auth0/auth0.dart';
import 'package:oauth_with_bloc/data/models/user.dart';

class Auth0Repository {
  final FlutterAppAuth _appAuth = FlutterAppAuth();
  final _secureStorage = const FlutterSecureStorage();

  AppUser parseIdToken(String idToken) {
    final List<String> parts = idToken.split('.');
    assert(parts.length == 3);

    return AppUser.fromJson(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

  Future<AppUser> login() async {
    try {
      final result =
          await _appAuth.authorizeAndExchangeCode(Auth0.authTokenRequest);

      final user = parseIdToken(result!.idToken!);

      await _secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);
      return user;
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'refresh_token');
  }

  Future<AppUser> init() async {
    final String? storedRefreshToken =
        await _secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken == null) throw Exception('user is not authroized');

    try {
      final TokenResponse? response =
          await _appAuth.token(Auth0.tokenRequest(storedRefreshToken));

      final user = parseIdToken(response!.idToken!);
      await _secureStorage.write(
          key: 'refresh_token', value: response.refreshToken);
      return user;
    } catch (e, s) {
      debugPrint('error on refresh token: $e - stack: $s');
      await logout();
      rethrow;
    }
  }
}
