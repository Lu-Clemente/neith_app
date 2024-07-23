import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home_view.dart';
import 'login_view.dart';
import 'email_confirmation_view.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  AuthWrapperState createState() => AuthWrapperState();
}

class AuthWrapperState extends State<AuthWrapper> {
  User? _user;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return const LoginView();
    } else if (!_user!.emailVerified) {
      return EmailConfirmationView(user: _user!);
    } else {
      return HomeView();
    }
  }
}
