import 'package:elearning/presentation/screens/homepage/home_page.dart';
import 'package:elearning/presentation/screens/signin/sign_in.dart';
import 'package:flutter/material.dart';

//// Created by PhucPT on 17/06/2023

class AppRoutes {
  static const home = '/home';
  static const signIn = '/signIn';

  static String get initialRoute => home;

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      home: (context) => const HomePage(),
      signIn: (context) => const SignIn(),
    };
  }

  AppRoutes._();
}
