// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home_view.dart';
import 'login_view.dart';

class EmailConfirmationView extends StatefulWidget {
  final User user;

  const EmailConfirmationView({super.key, required this.user});

  @override
  _EmailConfirmationViewState createState() => _EmailConfirmationViewState();
}

class _EmailConfirmationViewState extends State<EmailConfirmationView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _sendEmailVerification() async {
    widget.user.sendEmailVerification();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification email sent')),
    );
  }

  Future<void> _checkEmailVerified() async {
    await widget.user.reload();
    if (widget.user.emailVerified) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeView(
                  user: widget.user,
                )),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email not verified yet')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'A verification email has been sent to your email address.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendEmailVerification,
              child: const Text('Resend Verification Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkEmailVerified,
              child: Text('I have verified my email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              child: const Text('Go to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
