import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oauth_with_bloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:oauth_with_bloc/view/screens/home.dart';
import 'package:oauth_with_bloc/view/screens/splash_screen.dart';

import 'screens/login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return const Home();
          } else if (state is NotAuthenticated) {
            return const LogIn();
          }
          return const SplashScreen();
        },
      ),
    );
  }
}
