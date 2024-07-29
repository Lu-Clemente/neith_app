import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'services/auth.dart';
import 'views/auth/email_confirmation_view.dart';
import 'views/auth/login_view.dart';
import 'views/home_view.dart';
import 'views/auth/auth_provider.dart';

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
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
        ),
        home: const HomeController(),
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
                return HomeView();
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
