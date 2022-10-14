// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/const/strings.dart';
import 'package:shop_app/logic/auth.dart';
import 'package:shop_app/logic/notifier.dart';
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
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  Future<void> _submit(AuthNotifier model) async {
    try {
      await model.submit();
      if (!mounted) return;
      Navigator.of(context).pushNamed(bottomNavBarRoute);
    } catch (e) {
      // TODO: We will refactor this code into another widget in the next session
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Error!',
            style: Theme.of(context).textTheme.headline6,
          ),
          content: Text(
            e.toString(),
            style: Theme.of(context).textTheme.subtitle1,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<AuthBase>(context);
    return Consumer<AuthNotifier>(
      builder: (_, model, __) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 46),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.authFormType == AuthFormType.login
                            ? 'Login'
                            : 'Register',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 110,
                      ),
                      DefTextFormField(
                        'Enter Your Email',
                        'Email',
                        _emailController,
                        (value) =>
                            value!.isEmpty ? "Please Enter Your Email" : null,
                        focusNode: _emailFocusNode,
                        onChanged: (email){
                          model.updateEmail(email);
                        },
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_passwordFocusNode),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      DefTextFormField(
                        'Enter Your Password',
                        'Password',
                        _passwordController,
                        (value) => value!.isEmpty
                            ? "Please Enter Your Password"
                            : null,
                        focusNode: _passwordFocusNode,
                        obscureText: true,
                        onChanged: (password){
                          model.updatePassword(password);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (model.authFormType == AuthFormType.login)
                        Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: InkWell(
                            child: const Text("Forgot your password?"),
                            onTap: () {},
                          ),
                        ),
                      if (model.authFormType == AuthFormType.login)
                        const SizedBox(
                          height: 10,
                        ),
                      MainButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _submit(model);
                            }
                          },
                          text: model.authFormType == AuthFormType.login
                              ? 'Login'
                              : 'Register'),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: InkWell(
                          child: Text(model.authFormType == AuthFormType.login
                              ? "Don't have an account?"
                              : "Already have an account?"),
                          onTap: () {
                            _formKey.currentState!.reset();
                            _emailController.clear();
                            _passwordController.clear();
                            model.toggleAuthFormType();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          model.authFormType == AuthFormType.login
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
          ),
        );
      },
    );
  }
}
