part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  final AppUser user;

  Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class NotAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}
