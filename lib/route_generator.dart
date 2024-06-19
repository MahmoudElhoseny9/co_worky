import 'package:co_worky/presentation/pages/auth_page.dart';
import 'package:co_worky/presentation/pages/user_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AuthPage());
      case '/userPage':
        return MaterialPageRoute(builder: (_) => UserPage());
      default:
        // Handle unknown routes
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text('No route defined for ${settings.name}'),
                )));
    }
  }
}
