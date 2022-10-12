import 'package:flutter/material.dart';
import 'package:shop_app/const/strings.dart';
import 'package:shop_app/router.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE5E5E5),
        primaryColor: Colors.red,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: Theme.of(context).textTheme.subtitle1,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: authPageRoute,
    );
  }
}
