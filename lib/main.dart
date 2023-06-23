import 'package:elearning/presentation/route/app_routes.dart';
import 'package:elearning/presentation/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';

import 'di/injection.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Welcome(),
      routes: AppRoutes.getRoutes(context),
    );
  }
}
