import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'services/auth.dart';
import 'views/auth/auth_provider.dart';

import 'navigator_keys.dart';
import 'routes_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: AuthService(),
      child: MaterialApp(
        title: 'Neith',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(123, 166, 239, 1),
            secondary: const Color(0xFF1F1B59),
            surface: const Color.fromARGB(255, 255, 255, 255),
          ),
          fontFamily: 'Roboto',
        ),
        navigatorKey: NavigatorKeys.navigatorKeyMain,
        routes: routes,
        initialRoute: firebase_auth.FirebaseAuth.instance.currentUser == null
            ? '/login'
            : '/',
      ),
    );
  }
}
