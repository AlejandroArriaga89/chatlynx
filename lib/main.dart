import 'package:chatlynx/services/auth/auth_gate.dart';
import 'package:chatlynx/services/auth/login_or_register.dart';
import 'package:chatlynx/firebase_options.dart';
import 'package:chatlynx/screens/screens.dart';
import 'package:chatlynx/themes/light_mode.dart';
import 'package:chatlynx/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthGate(),
      debugShowCheckedModeBanner: false,
      routes: {
        'Login': (context) => LoginScreen(),
        'Register': (context) => RegisterScreen(),
        'Home': (context) => HomeScreen(),
        'Settings': (context) => SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
