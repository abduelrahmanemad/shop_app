import 'package:flutter/material.dart';
import 'package:shop_app/const/utilities.dart';
import 'package:shop_app/logic/auth.dart';

class AuthNotifier with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;

  Future submit() async {
    authFormType == AuthFormType.login
        ? await auth.signInWithEmailAndPassword(email, password)
        : await auth.signUpWithEmailAndPassword(email, password);
  }

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);

  void toggleAuthFormType() {
    authFormType = authFormType == AuthFormType.login
        ? authFormType = AuthFormType.register
        : authFormType = AuthFormType.login;
    copyWith(
      email: '',
      password: '',
    );
  }

  AuthNotifier(
      {required this.auth,
      this.email = '',
      this.password = '',
      this.authFormType = AuthFormType.login});

  void copyWith({String? email, String? password, AuthFormType? authFormType}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }
}
