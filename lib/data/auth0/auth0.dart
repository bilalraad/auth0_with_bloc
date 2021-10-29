import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:oauth_with_bloc/data/auth0/const.dart';

class Auth0 {
  static final userInfoUri = Uri.parse('https://$AUTH0_DOMAIN/userinfo');
  static final authTokenRequest = AuthorizationTokenRequest(
    AUTH0_CLIENT_ID,
    AUTH0_REDIRECT_URI,
    issuer: 'https://$AUTH0_DOMAIN',
    scopes: <String>['openid', 'profile', 'offline_access', 'email'],
    promptValues: ['login'],
  );
  static TokenRequest tokenRequest(String refreshToken) => TokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        refreshToken: refreshToken,
      );
}
