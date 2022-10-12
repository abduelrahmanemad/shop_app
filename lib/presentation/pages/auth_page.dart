// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:shop_app/presentation/widgets/main_button.dart';
import 'package:shop_app/presentation/widgets/text_form_field.dart';

import '../../const/utilities.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthFormType _authType = AuthFormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 46),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _authType == AuthFormType.login ? 'Login' : 'Register',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 160,
                ),
                DefTextFormField(
                    'Enter Your Email',
                    'Email',
                    _emailController,
                    (value) =>
                        value!.isEmpty ? "Please Enter Your Email" : null),
                const SizedBox(
                  height: 24,
                ),
                DefTextFormField(
                    'Enter Your Password',
                    'Password',
                    _passwordController,
                    (value) =>
                        value!.isEmpty ? "Please Enter Your Password" : null),
                const SizedBox(
                  height: 16,
                ),
                if (_authType == AuthFormType.login)
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: InkWell(
                      child: const Text("Forgot your password?"),
                      onTap: () {},
                    ),
                  ),
                if (_authType == AuthFormType.login)
                  const SizedBox(
                    height: 10,
                  ),
                MainButton(
                    onTap: () {},
                    text:
                        _authType == AuthFormType.login ? 'Login' : 'Register'),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: InkWell(
                    child: Text(_authType == AuthFormType.login
                        ? "Don't have an account?"
                        : "Already have an account?"),
                    onTap: () {
                      setState(() {
                        if (_authType == AuthFormType.login) {
                          _authType = AuthFormType.register;
                        } else {
                          _authType = AuthFormType.login;
                        }
                      });
                    },
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    _authType == AuthFormType.login
                        ? 'or login with'
                        : 'or register with',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}