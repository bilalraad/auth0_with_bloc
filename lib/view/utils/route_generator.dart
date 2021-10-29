import 'package:flutter/material.dart';
import 'package:oauth_with_bloc/view/screens/home.dart';
import 'package:oauth_with_bloc/view/screens/login.dart';

import '../app.dart';
import 'app_functions.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return createRoute(const App());
      case '/login':
        return createRoute(const LogIn());
      case '/home':
        return createRoute(const Home());
      default:
        return createRoute(const ErrorNotFoundPage());
    }
  }
}

class ErrorNotFoundPage extends StatelessWidget {
  const ErrorNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ERROR'),
      ),
      body: const Center(
        child: Text('404 Page not found'),
      ),
    );
  }
}
