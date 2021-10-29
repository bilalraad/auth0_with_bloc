part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class AppStarted extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoggedIn extends AuthEvent {
  final AppUser user;
  LoggedIn(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoggedIn {user: $user }';
}

class LoggedOut extends AuthEvent {
  @override
  List<Object?> get props => [];
}
