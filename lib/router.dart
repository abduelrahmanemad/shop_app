import 'package:flutter/material.dart';
import 'package:shop_app/presentation/pages/auth_page.dart';
import 'package:shop_app/presentation/pages/landing_page.dart';

import 'const/strings.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings){
    switch (settings.name){
      case landingPageRoute:
        return MaterialPageRoute(
          builder: (_) {
            return const LandingPage();
          },
        );
      case authPageRoute:
        return MaterialPageRoute(
          builder: (_) {
            return const AuthPage();
          },
        );
      default:MaterialPageRoute(
          builder: (_) {
            return const LandingPage();
          },
      );
    }
  }
}