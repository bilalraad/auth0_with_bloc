import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:oauth_with_bloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:oauth_with_bloc/data/auth0/auth0_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Auth0Repository _authRepository;
  final AuthBloc _authBloc;

  LoginCubit(
    this._authRepository,
    this._authBloc,
  ) : super(LoginInitial());

  void logIn() async {
    emit(LoginLoading());
    try {
      final user = await _authRepository.login();
      _authBloc.add(LoggedIn(user));
      emit(LoginInitial());
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  void logOut() async {
    emit(LoginLoading());

    await _authRepository.logout();
    _authBloc.add(LoggedOut());
    emit(LoginInitial());
  }
}
