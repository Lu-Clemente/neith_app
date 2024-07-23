// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home_view.dart';

class EmailConfirmationView extends StatefulWidget {
  final User user;

  const EmailConfirmationView({super.key, required this.user});

  @override
  EmailConfirmationViewState createState() => EmailConfirmationViewState();
}

class EmailConfirmationViewState extends State<EmailConfirmationView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Timer? _timer;
  bool isVerified = false;

  Future<void> _sendEmailVerification() async {
    widget.user.sendEmailVerification();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification email sent')),
    );
  }

  Future<bool> _checkEmailVerified() async {
    await widget.user.reload();
    if (widget.user.emailVerified) {
      return true;
    }
    return false;
  }

  _handleEmailVerification() async {
    bool isVerified = await _checkEmailVerified();
    if (isVerified) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email not verified')),
      );
    }
  }

  void _navigateToHome() {
    _timer?.cancel(); // Stop the timer once the user is verified
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }

  void _startVerificationCheck() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.reload();
        user = _auth.currentUser;
        if (user != null && user.emailVerified) {
          setState(() {
            isVerified = true;
          });
          _navigateToHome();
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _sendEmailVerification();
    _startVerificationCheck();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
              onPressed: _handleEmailVerification,
              child: const Text('I have verified my email'),
            ),
          ],
        ),
      ),
    );
  }
}
