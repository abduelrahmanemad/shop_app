import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/logic/notifier.dart';

import '../../logic/auth.dart';
import 'auth_page.dart';
import 'bottom_navbar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return ChangeNotifierProvider<AuthNotifier>(
              create: (_) => AuthNotifier(auth: auth),
              child: const AuthPage(),
            );
          }
          return ChangeNotifierProvider<AuthNotifier>(
            create: (_) => AuthNotifier(auth: auth),
            child: const BottomNavBar(),
          );
        }
        // TODO: We will refactor this to make one component for loading
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}