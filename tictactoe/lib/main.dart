import 'package:flutter/material.dart';

import 'pages/challenge.dart';
import 'pages/login.dart';
import 'pages/register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'login': (context) => const Login(),
        'register': (context) => const Register(),
        'challenge': (context) => const Challenge(),
      },
      initialRoute: 'login',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 97, 238, 179)),
          filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 112, 168, 112)))),
    );
  }
}
