import 'package:chatlynx/auth/login_or_register.dart';
import 'package:chatlynx/screens/screens.dart';
import 'package:chatlynx/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginOrRegister(),
      debugShowCheckedModeBanner: false,
      routes: {
        'Login': (context) => LoginScreen(),
        'Register': (context) => RegisterScreen(),
      },
      theme: lightmode,
    );
  }
}
