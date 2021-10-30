import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:oauth_with_bloc/data/auth0/auth0_repo.dart';
import 'package:oauth_with_bloc/data/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Auth0Repository _authRepository;
  AuthBloc(
    this._authRepository,
  ) : super(const AuthState.init()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>((event, emit) {
      emit(AuthState.authenticated(event.user));
    });
    on<LoggedOut>((event, emit) {
      emit(const AuthState.unauthenticated());
    });
  }

  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthState.init());
      final user = await _authRepository.init();
      add(LoggedIn(user));
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }
}
