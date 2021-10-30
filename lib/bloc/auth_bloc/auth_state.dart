part of 'auth_bloc.dart';

enum AuthStatus { initial, authenticated, notAuthenticated }

class AuthState extends Equatable {
  const AuthState._({
    this.status = AuthStatus.initial,
    this.user = AppUser.empty,
  });

  const AuthState.init() : this._();

  const AuthState.authenticated(AppUser user)
      : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.notAuthenticated);

  final AuthStatus status;
  final AppUser user;

  @override
  List<Object> get props => [status, user];
}
