import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'services/auth.dart';
import 'views/auth/email_confirmation_view.dart';
import 'views/auth/login_view.dart';
import 'views/home/home_view.dart';
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
            primary: const Color(0xFF7BA6EF),
            secondary: const Color(0xFF1F1B59),
            background: const Color.fromARGB(255, 255, 255, 255),
          ),
          fontFamily: 'Roboto',
        ),
        navigatorKey: NavigatorKeys.navigatorKeyMain,
        routes: routes,
        initialRoute: '/',
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  const HomeController({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthProvider.of(context)!.auth;

    return StreamBuilder(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return const LoginView();
            } else {
              if (!user.emailVerified) {
                return EmailConfirmationView(user: user);
              } else {
                return const HomeView();
              }
            }
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
