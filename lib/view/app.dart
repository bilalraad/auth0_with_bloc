import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oauth_with_bloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:oauth_with_bloc/bloc/cat_breed_search/cat_breed_search_bloc.dart';
import 'package:oauth_with_bloc/bloc/cat_breeds_list/cat_breeds_bloc.dart';
import 'package:oauth_with_bloc/data/cat_api/cat_api_repo.dart';
import 'package:oauth_with_bloc/view/screens/home.dart';
import 'package:oauth_with_bloc/view/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'screens/login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catApiRepo = TheCatApiRepository();
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) =>
                        CatBreedsListBloc(catApiRepo)..add(LoadBreeds())),
                BlocProvider(
                    create: (context) => CatBreedSearchBloc(catApiRepo)),
              ],
              child: const Home(),
            );
          } else if (state.status == AuthStatus.notAuthenticated) {
            return const LogIn();
          }
          return const SplashScreen();
        },
      ),
    );
  }
}
