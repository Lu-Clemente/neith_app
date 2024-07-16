import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home_view.dart';
import 'login_view.dart';
import 'email_confirmation_view.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  late Stream<User?> _userStream;

  @override
  void initState() {
    super.initState();
    _userStream = FirebaseAuth.instance.authStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (snapshot.hasData) {
          User? user = snapshot.data;
          if (user != null) {
            if (user.emailVerified) {
              return HomeView(user: user);
            } else {
              return EmailConfirmationView(user: user);
            }
          } else {
            return const LoginView();
          }
        } else {
          return const LoginView();
        }
      },
    );
  }
}
