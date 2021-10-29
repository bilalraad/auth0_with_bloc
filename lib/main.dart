import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oauth_with_bloc/bloc/login_cubit/login_cubit.dart';
import 'package:oauth_with_bloc/data/auth0/auth0_repo.dart';
import 'package:oauth_with_bloc/view/utils/route_generator.dart';

import 'bloc/auth_bloc/auth_bloc.dart';

void main() {
  final authRepo = Auth0Repository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
        create: (BuildContext context) => AuthBloc(authRepo)..add(AppStarted()),
      ),
      BlocProvider<LoginCubit>(
        create: (BuildContext context) =>
            LoginCubit(authRepo, context.read<AuthBloc>()),
      ),
    ],
    child: const OauthWithBloc(),
  ));
}

class OauthWithBloc extends StatelessWidget {
  const OauthWithBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
